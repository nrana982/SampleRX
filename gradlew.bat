ΚώΊΎ   3* groovy/lang/GroovyCodeSource  java/lang/Object  GroovyCodeSource.java groovy/lang/GroovyCodeSource$1  
codeSource Ljava/security/CodeSource; name Ljava/lang/String; 
scriptText certs ![Ljava/security/cert/Certificate; cachable Z file Ljava/io/File; url Ljava/net/URL; <init> 9(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V ()V  
   
 	    	   createCodeSource .(Ljava/lang/String;)Ljava/security/CodeSource;  
     		  "  	  $ this Lgroovy/lang/GroovyCodeSource; script codeBase 7(Ljava/io/Reader;Ljava/lang/String;Ljava/lang/String;)V java/io/IOException + +org/codehaus/groovy/runtime/IOGroovyMethods - getText $(Ljava/io/Reader;)Ljava/lang/String; / 0
 . 1 java/io/Reader 3 java/lang/String 5 java/lang/RuntimeException 7 java/lang/StringBuilder 9
 :  BImpossible to read the text content from that reader, for script:  < append -(Ljava/lang/String;)Ljava/lang/StringBuilder; > ?
 : @  with codeBase:  B toString ()Ljava/lang/String; D E
 : F *(Ljava/lang/String;Ljava/lang/Throwable;)V  H
 8 I e Ljava/io/IOException; reader Ljava/io/Reader; #(Ljava/io/File;Ljava/lang/String;)V java/lang/SecurityException P 'java/security/PrivilegedActionException R java/io/File T getCanonicalPath V E
 U W (Ljava/lang/String;)V  Y
 U Z exists ()Z \ ]
 U ^ java/io/FileNotFoundException `
 U F  ( c getAbsolutePath e E
 U f ) h
 a Z isDirectory k ]
 U l "java/lang/IllegalArgumentException n *) is a directory not a Groovy source file. p
 o Z canRead s ]
 U t 9 can not be read. Check the read permission of the file " v " ( x ). z
 8 Z  	  } O(Lgroovy/lang/GroovyCodeSource;Ljava/lang/String;Ljava/io/File;Ljava/io/File;)V  
   java/security/AccessController  doPrivileged =(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;  
   [Ljava/lang/Object;  java/security/CodeSource  getCause ()Ljava/lang/Throwable;  
 S  java/lang/Throwable  )Could not construct CodeSource for file:   -(Ljava/lang/Object;)Ljava/lang/StringBuilder; > 
 :  Ljava/lang/SecurityException; info cause Ljava/lang/Throwable; pa