#include "frontend_functions.h"

Frontend_functions::Frontend_functions(QObject *parent) : QObject(parent) {
    splaydata = {"cba", "peepy"};
    mindata = {"abc","peppy"};
    splaytime = 0;
    mintime = 3;
    textCounter = 1;
    splay_min = 0;
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
        curr_text = QString::fromStdString("Your probability at is" + to_string(probability) + "%");
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

void Frontend_functions::toggleSplay(){
    splay_min = 0;
}

void Frontend_functions::toggleMin(){
    splay_min = 1;
}