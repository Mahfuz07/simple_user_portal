package com.mahfuz

import grails.gorm.services.Service
import grails.gorm.transactions.Transactional

import java.text.ParseException
import java.text.SimpleDateFormat
import java.time.LocalDate
import java.time.Period

@Service(User)
class UserService {


    List<User> age (){

    }


    def serviceMethod() {
    }

     int AgeCheck(String age) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Period diff1 = null ;
        Date d;
        try {
            d = sdf.parse(age);
            Calendar c = Calendar.getInstance();
            c.setTime(d);
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH) + 1;
            int date = c.get(Calendar.DATE);
            LocalDate l1 = LocalDate.of(year, month, date);
            LocalDate now1 = LocalDate.now();
            diff1 = Period.between(l1, now1);

        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return diff1.getYears();
    }

}
