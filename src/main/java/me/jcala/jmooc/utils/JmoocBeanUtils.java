package me.jcala.jmooc.utils;

import me.jcala.jmooc.entity.Lesson;

import java.util.Set;

public class JmoocBeanUtils {

    public static Set<Lesson> setFileAndExeNum(Set<Lesson> lessons){

        for (Lesson lesson:lessons){
            if (lesson.getExerciseList()==null){
                lesson.setExeNum(0);
            }else {
                lesson.setExeNum(lesson.getExerciseList().size());
            }

            if (lesson.getUpFileList()==null){
                lesson.setFileNum(0);
            }else {
                int size=JsonUtils.instance.readJsonToFileList(lesson.getUpFileList()).size();
                lesson.setFileNum(size);
            }
        }
        return lessons;
    }

}