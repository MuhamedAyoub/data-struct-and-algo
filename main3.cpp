#include <iostream>
#include <vector>
#include <bits/stdc++.h>
using namespace std;

int Cardinal(vector<int> s, int w)
{
    int j;
    int tab[s.size()][w + 1];
    // initialisation
    for (j = 0; j < s.size(); j++)
        tab[j][0] = 1;
    for (int i = 0; i < s.size(); i++)
        for (int j = 1; j < w + 1; j++)
            tab[i][j] = 0;

    for (j = 1; j < w + 1; j++)
    {
        if (j % s[0] == 0)
        {
            tab[0][j] = 1;
        }
    }
    for (int i = 0; i < s.size(); i++)
    {
        for (j = 1; j < w + 1; j++)
        {
            cout << " " << tab[i][j] << " " << endl;
        }
        "\n";
    }
    for (int i = 1; i < s.size(); i++)
    {
        for (j = 1; j < w + 1; j++)
        {
            if (j > s[i])
            {
                tab[i][j] = tab[i - 1][j] + tab[i][j - s[i]];
            }
            else
            {
                tab[i][j] = tab[i - 1][j];
            }
        }
    }

    return tab[s.size() - 1][w];
}

int main()
{
    vector<int> v;
    int x;
    char c;
    do
    {
        cout << "Enter your Numbers : ";
        cin >> x;
        v.push_back(x);
        cout << "Click on Q to finish :";
        cin >> c;
        '\n';

    } while (c != 'Q' && c != 'q');
    '\n';
    cout << "Enter a Num ; ";
    cin >> x;
    '\n';
    cout << " the number of Cardinal is : " << Cardinal(v, x) << endl;

    return 0;
}