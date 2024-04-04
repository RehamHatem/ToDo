import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/model.dart';

class FirebaseFunctions {

   static CollectionReference<TaskModel> getTasksCollection(){
      return FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>(
        fromFirestore: (snapshot, _) {
          return TaskModel.fromJson(snapshot.data()!);

        }, toFirestore: (value, _) {
        return value.toJson();

      },);
    }
    static Future<void>  addTask(TaskModel task){
      var collection=getTasksCollection();
      var docRef=collection.doc();
      task.id=docRef.id;
      return docRef.set(task);

    }
   static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date){
     return getTasksCollection()
         .where("date",isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
         .snapshots();

    }
   static Future<void> daleteTask(String id){
     return getTasksCollection().doc(id).delete();
    }
   static Future<void> updateTask(String id,TaskModel task){
     return getTasksCollection().doc(id).update(task.toJson());
   }

  }
