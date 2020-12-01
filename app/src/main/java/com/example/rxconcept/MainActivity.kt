package com.example.rxconcept

import android.annotation.SuppressLint
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import io.reactivex.Observable
import io.reactivex.Observer
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.disposables.Disposable
import io.reactivex.schedulers.Schedulers
import java.util.concurrent.TimeUnit


class MainActivity : AppCompatActivity() {

    private var TAG = "MainActivity"
    private var buttonobserve: Button?=null
    private var buttonCreateOperator:Button?=null

    private var disposable: CompositeDisposable = CompositeDisposable()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        buttonobserve=findViewById(R.id.observe_button)
        buttonCreateOperator= findViewById(R.id.create_button)

        buttonobserve?.setOnClickListener(){
            startStream()
        }
        buttonCreateOperator?.setOnClickListener(){
             // rangeOperator()
            //createOperator()
            //interValOperator()
           // fromOperator()
            //filterOperator()
            transformOperator()
        }
    }

    private fun startStream() {

        val list = listOf("1", "2", "3", "4", "5")

        val taskObservable: Observable<String> = Observable
            // create a new Observable object
            .fromIterable(list) // apply 'fromIterable' operator
            .subscribeOn(Schedulers.io()) // designate worker thread (background)
            .observeOn(AndroidSchedulers.mainThread()) // designate observer thread (main thread)

        taskObservable.subscribe(object : Observer<String> {
            override fun onSubscribe(d: Disposable) {
                disposable.add(d)
            }

            override fun onNext(s: String) { // run on main thread
                Log.d(TAG, "onNext: : $s")
            }

            override fun onError(e: Throwable) {
                Log.e(TAG, "onError: " + e.message)
            }

            override fun onComplete() {
                Log.d(TAG, "!onComplete called")
            }
        })
/*//Apply the toObservable() extension function//
        list.toObservable()
//Construct your Observer using the subscribeBy() extension function//
            .subscribeBy(
                onNext = { println(it) },
                onError = { it.printStackTrace() },
                onComplete = { println("onComplete!") }
            )*/
    }

    override fun onDestroy() {
        super.onDestroy()
        disposable.clear()
        //disposable.dispose()
    }

    //Create operator
    @SuppressLint("CheckResult")
    private fun createOperator(){

        /*We can use single object or list of object
        */
        val list = listOf("1", "2", "3", "4", "5")
         Observable
            .create<String> { emitter ->
            // do something and emit first item
            if (!emitter.isDisposed) {
                emitter.onNext(list.forEach { t -> println(t) }.toString())
            }
            // do something and emit second item
            if (!emitter.isDisposed) {
                emitter.onNext(list.forEach { t -> println(t) }.toString())
            }
            // on complete
            if (!emitter.isDisposed) {
                emitter.onComplete()
                Log.d(TAG, "!onComplete called")
            }
        }
            .subscribeOn(Schedulers.io())
            .subscribe {
                Log.d(TAG, "" + list)
            }
    }

    private fun rangeOperator(){

        val taskObservable: Observable<Int>? = Observable
            .range(0, 3)
            .subscribeOn(Schedulers.io())
            .repeat(3)
            .observeOn(AndroidSchedulers.mainThread())
        taskObservable?.subscribe(object : Observer<Int> {
            override fun onSubscribe(d: Disposable) {
                disposable.add(d)
            }

            override fun onError(e: Throwable) {
                Log.e(TAG, "onError: " + e.message)
            }

            override fun onComplete() {
                Log.d(TAG, "!onComplete called")
            }

            override fun onNext(t: Int) {
                Log.e(TAG, "onNext: $t")
            }
        })
    }

    private fun interValOperator(){
        // emit an observable every time interval
        // emit an observable every time interval
        /*val intervalObservable = Observable
            .interval(1, TimeUnit.SECONDS)
            .subscribeOn(Schedulers.io())
            .takeWhile { aLong ->
                // stop the process if more than 5 seconds passes
                Log.d(TAG,"test"+Thread.currentThread().name)
                aLong <= 5
            }
            .observeOn(AndroidSchedulers.mainThread())*/

        // emit single observable after a given delay
        // emit single observable after a given delay
        val timeObservable = Observable
            .timer(3, TimeUnit.SECONDS)
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
        timeObservable.subscribe(object : Observer<Long> {
            override fun onSubscribe(d: Disposable) {
                disposable.add(d)
            }

            override fun onError(e: Throwable) {
                Log.e(TAG, "onError: " + e.message)
            }

            override fun onComplete() {
                Log.d(TAG, "!onComplete called")
            }

            override fun onNext(t: Long) {
                Log.e(TAG, "onNext: $t")
            }
        })
    }
    
    private fun fromOperator(){
        /*fromArray
        * fromIterable
        * fromCallable
        * */
//for iterable
       /* val taskList: MutableList<Int> = ArrayList()
        taskList.add(3)
        taskList.add(2)
        taskList.add(1)
        taskList.add(0)
        taskList.add(5)

        val taskObservable = Observable
            .fromIterable(taskList)
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())

        taskObservable.subscribe(object : Observer<Int> {
            override fun onSubscribe(d: Disposable) {}
            override fun onError(e: Throwable) {}
            override fun onComplete() {}
            override fun onNext(t:Int) {
                taskList.forEach { t -> println(t) }.toString()
                Log.e(TAG, "onNext: $t")
            }
        })*/

//for fromArray
        val list = arrayOf(1, 2, 3)
        val taskObservable = Observable
            .fromArray(list)
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())

        taskObservable.subscribe(object : Observer<Array<Int>> {
            override fun onSubscribe(d: Disposable) {}
            override fun onError(e: Throwable) {}
            override fun onComplete() {}
            override fun onNext(t: Array<Int>) {
                list.forEach { t -> println(t) }.toString()
                Log.e(TAG, "onNext: $t")
            }
        })

        //for fromCallable
        // create Observable (method will not execute yet)
       /* val callable: Observable<Int> = Observable
            .fromCallable(Callable<Int> { MyDatabase.getTask() })
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())

// method will be executed since now something has subscribed

// method will be executed since now something has subscribed
        callable.subscribe(object : Observer<Int> {
            override fun onSubscribe(d: Disposable) {}
            override fun onNext(t: Int) {
                Log.d(TAG, "onNext: : $t" )
            }

            override fun onError(e: Throwable) {}
            override fun onComplete() {}
        })*/

    }

    private fun filterOperator(){
        /*We will be covering below filter operator
        *filterOperator
        * distinctOperator
        *  */

        //for filter operator
       /* val list = listOf(1, 2, 3, 4, 5)
        val taskObservable: Observable<Int> = Observable
            .fromIterable(list)
            .filter{ list ->
                Log.d(TAG,"test"+Thread.currentThread().name)
                list == 1
            }
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())

        taskObservable.subscribe(object : Observer<Int> {
            override fun onSubscribe(d: Disposable) {}
            override fun onNext(t: Int) {
                Log.d(TAG, "onNext: This task matches the description: $t")
            }
            override fun onError(e: Throwable) {}
            override fun onComplete() {}
        })*/

        //for distinct operator
        val list = listOf(1, 1, 1, 1, 1, 2, 5, 3, 4, 4, 6, 5)
        val taskObservable: Observable<Int> = Observable
            .fromIterable(list)
            .distinct{ list->
                Log.d(TAG, "test" + Thread.currentThread().name)
                list
            }
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())

        taskObservable.subscribe(object : Observer<Int> {
            override fun onSubscribe(d: Disposable) {}
            override fun onNext(t: Int) {
                Log.d(TAG, "onNext: This task matches the description: $t")
            }

            override fun onError(e: Throwable) {}
            override fun onComplete() {}
        })
    }

    @SuppressLint("CheckResult")
    private fun transformOperator(){
        val numbers: List<Int> = listOf(1, 2, 3)
        Observable.fromArray(numbers)
            .map { number ->
                number.toString() // convert each integer into a string and return it
            }
            .subscribe {
                Log.d(TAG,"onNext :$numbers") // print out the strings
            }
    }
}
