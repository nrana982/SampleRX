����   3Z groovy/lang/ExpandoMetaClass  groovy/lang/MetaClassImpl  groovy/lang/GroovyObject  ExpandoMetaClass.java ,groovy/lang/ExpandoMetaClass$MixedInAccessor  MixedInAccessor 2groovy/lang/ExpandoMetaClass$StaticDefiningClosure  StaticDefiningClosure ,groovy/lang/ExpandoMetaClass$DefiningClosure  DefiningClosure 4groovy/lang/ExpandoMetaClass$SubClassDefiningClosure  SubClassDefiningClosure 3groovy/lang/ExpandoMetaClass$ExpandoMetaConstructor  ExpandoMetaConstructor 0groovy/lang/ExpandoMetaClass$ExpandoMetaProperty  ExpandoMetaProperty %groovy/lang/ExpandoMetaClass$Callable  Callable groovy/lang/ExpandoMetaClass$4  groovy/lang/ExpandoMetaClass$3  groovy/lang/ExpandoMetaClass$2 ! groovy/lang/ExpandoMetaClass$1 # :java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock % 1java/util/concurrent/locks/ReentrantReadWriteLock ' ReadLock ;java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock * 	WriteLock EMPTY_CLASS_ARRAY [Ljava/lang/Class; 
META_CLASS Ljava/lang/String; 	metaClass 1 CLASS class 4 META_METHODS metaMethods 7 METHODS methods : 
PROPERTIES 
properties = STATIC_QUALIFIER static @ CONSTRUCTOR constructor C CLASS_PROPERTY META_CLASS_PROPERTY GROOVY_CONSTRUCTOR <init> H myMetaClass Lgroovy/lang/MetaClass; initialized Z modified 
initCalled rwl 3Ljava/util/concurrent/locks/ReentrantReadWriteLock; readLock !Ljava/util/concurrent/locks/Lock; 	writeLock allowChangesAfterInit 
inRegistry inheritedMetaMethods Ljava/util/Set; )Ljava/util/Set<Lgroovy/lang/MetaMethod;>; beanPropertyCache Ljava/util/Map; =Ljava/util/Map<Ljava/lang/String;Lgroovy/lang/MetaProperty;>; staticBeanPropertyCache expandoMethods PLjava/util/Map<Lorg/codehaus/groovy/runtime/MethodKey;Lgroovy/lang/MetaMethod;>; expandoSubclassMethods (Ljava/util/concurrent/ConcurrentHashMap; expandoProperties invokeStaticMethodMethod ?Lorg/codehaus/groovy/runtime/metaclass/ClosureStaticMetaMethod; mixinClasses BLjava/util/Set<Lorg/codehaus/groovy/reflection/MixinInMetaClass;>; getExpandoSubclassMethods ()Ljava/util/Collection; ` a	  i &java/util/concurrent/ConcurrentHashMap k values m h
 l n this Lgroovy/lang/ExpandoMetaClass; /(Ljava/lang/Class;ZZ[Lgroovy/lang/MetaMethod;)V groovy/lang/GroovySystem s getMetaClassRegistry !()Lgroovy/lang/MetaClassRegistry; u v
 t w N(Lgroovy/lang/MetaClassRegistry;Ljava/lang/Class;ZZ[Lgroovy/lang/MetaMethod;)V H y
  z theClass Ljava/lang/Class; register add [Lgroovy/lang/MetaMethod; L(Lgroovy/lang/MetaClassRegistry;Ljava/lang/Class;[Lgroovy/lang/MetaMethod;)V H �
  � ()V H �
 ( � P Q	  � >()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock; R �
 ( � R S	  � ?()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock; T �
 ( � T S	  � java/util/HashSet �
 � � W X	  �?@   (IFI)V H �
 l � Z [	  � ] [	  � ^ [	  � b [	  � java/util/LinkedHashSet �
 � � e X	  � java/lang/Object � getClass ()Ljava/lang/Class; � �
 � � )org/codehaus/groovy/runtime/InvokerHelper � getMetaClass *(Ljava/lang/Class;)Lgroovy/lang/MetaClass; � �
 � � J K	  � V M	  � U M	  � registry Lgroovy/lang/MetaClassRegistry; (Ljava/lang/Class;)V H r
  � -(Ljava/lang/Class;[Lgroovy/lang/MetaMethod;)V (Ljava/lang/Class;Z)V .(Ljava/lang/Class;Z[Lgroovy/lang/MetaMethod;)V (Ljava/lang/Class;ZZ)V findMixinMethod >(Ljava/lang/String;[Ljava/lang/Class;)Lgroovy/lang/MetaMethod; >org/codehaus/groovy/runtime/metaclass/MethodSelectionException � java/util/Set � iterator ()Ljava/util/Iterator; � � � � java/util/Iterator � hasNext ()Z � � � � next ()Ljava/lang/Object; � � � � /org/codehaus/groovy/reflection/MixinInMetaClass � getMixinClass .()Lorg/codehaus/groovy/reflection/CachedClass; � �
 � � *org/codehaus/groovy/reflection/CachedClass � 	classInfo *Lorg/codehaus/groovy/reflection/ClassInfo; � �	 � � (org/codehaus/groovy/reflection/ClassInfo � getMetaClassForClass ()Lgroovy/lang/MetaClass; � �
 � � getTheClass � �
 � � groovy/lang/MetaClassRegistry � � � groovy/lang/MetaClass � 
pickMethod � � � � getTheCachedClass � �
  � getCachedSuperClass � �
 � � groovy/lang/MetaMethod � getMethodWithoutCaching P(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Z)Lgroovy/lang/MetaMethod; � �
  � =org/codehaus/groovy/runtime/metaclass/MixinInstanceMetaMethod L(Lgroovy/lang/MetaMethod;Lorg/codehaus/groovy/reflection/MixinInMetaClass;)V H
 getParameterTypes /()[Lorg/codehaus/groovy/reflection/CachedClass;
 � isPrimitive
 M	 � - .	 
  � � �
  java/lang/String . registerInstanceMethod (Lgroovy/lang/MetaMethod;)V
  cl ,Lorg/codehaus/groovy/reflection/CachedClass; mc Lgroovy/lang/MetaClassImpl; noParam Lgroovy/lang/MetaMethod; method 
mixinClass 
metaMethod mixin 1Lorg/codehaus/groovy/reflection/MixinInMetaClass; 
methodName 	arguments onInvokeMethodFoundInHierarchy invokeMethodMethod'	 ( onSuperMethodFoundInHierarchy addSuperMethodIfNotOverridden+
 , onSuperPropertyFoundInHierarchy !(Lgroovy/lang/MetaBeanProperty;)V 