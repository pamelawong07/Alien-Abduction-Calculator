#include "frontend_functions.h"

Frontend_functions::Frontend_functions(QObject *parent) : QObject(parent) {
    splaydata = {"cba", "peepy"};
    mindata = {"abc","peppy"};
    splaytime = 0;
    mintime = 3;
    textCounter = 0;
    splay_min = 0;
    curr_city = "elbownia";
    num_encounters = 100;
    total_encounters = 373737;
}

void Frontend_functions::getData(){
    vector<string> received_splaydata = {"abc","peppy"};    //will call backend functions
    vector<string> received_mindata = {"cba", "peepy"};     //instead of direct declaration when possible
    splaydata = received_splaydata;
    mindata = received_mindata;
    splaytime = 0;
    mintime = 3;
}

QString Frontend_functions::getText(){
    QString curr_text;
    if (textCounter == 0){
        float probability = 0.01;       //will get probability from backend function
        curr_text = QString::fromStdString("Your probability of encountering an alien at " + curr_city + " is " + to_string(probability) + "%!");
        curr_text += QString::fromStdString("\n\nThere have been " + to_string(num_encounters) + " reported alien encounters in " + curr_city + " out of " + to_string(total_encounters) +  " in the country.");
        curr_text += QString::fromStdString("\n\nClick the arrows below to read reported encounters, if any.");
    }
    else if (!splay_min)
        curr_text = QString::fromStdString(splaydata[textCounter-1]);
    else
        curr_text = QString::fromStdString(mindata[textCounter-1]);
    return curr_text;
}

QString Frontend_functions::getTime(){
    QString curr_text;
    if (!splay_min)
        curr_text = QString::fromStdString("TIME: " + to_string(splaytime) + " secs");
    else
        curr_text = QString::fromStdString("TIME: " + to_string(mintime) + " secs");
    return curr_text;
}

void Frontend_functions::toggleCounter(bool direction){
    if (direction == 0){    //left toggle
        if (textCounter > 0)
            textCounter--;
    }
    else{
        if (textCounter < splaydata.size())
            textCounter++;
    }
}

void Frontend_functions::toggleSplay(){
    splay_min = 0;
}

void Frontend_functions::toggleMin(){
    splay_min = 1;
}