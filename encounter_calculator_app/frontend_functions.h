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
    int textCounter = 1;
    bool splay_min = 0;     //0: splay 1: minheap
    vector<string> splaydata;
    vector<string> mindata;
public:
    //constructor
    explicit Frontend_functions(QObject *parent = nullptr);
    //updates splaydata and mindata whenever "calculate probability" is run
    Q_INVOKABLE void getData();
    //gets current text (report) to be shown in box
    Q_INVOKABLE QString getText();
    Q_INVOKABLE void toggleSplay();
    Q_INVOKABLE void toggleMin();
signals:
    //void buttonClicked();
};

#endif // FRONTEND_FUNCTIONS_H
