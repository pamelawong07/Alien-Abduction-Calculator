#ifndef FRONTEND_FUNCTIONS_H
#define FRONTEND_FUNCTIONS_H

#include <QObject>
#include <QtQml>
#include <string>
#include <vector>
using namespace std;

class Frontend_functions : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    int textCounter;
    bool splay_min;     //0: splay 1: minheap
    vector<string> splaydata;
    vector<string> mindata;
    float mintime;
    float splaytime;
public:
    //constructor
    explicit Frontend_functions(QObject *parent = nullptr);
    //updates splaydata and mindata whenever "calculate probability" is run
    Q_INVOKABLE void getData();
    //gets current text (report) to be shown in box
    Q_INVOKABLE QString getText();
    //gets time to display
    Q_INVOKABLE QString getTime();
    Q_INVOKABLE void toggleSplay();
    Q_INVOKABLE void toggleMin();
signals:
    //void buttonClicked();
};

#endif // FRONTEND_FUNCTIONS_H
