#include <iostream>
#include <queue>
#include <cstdlib>
#include <algorithm>
#include <bits/stdc++.h>
// #include "conio "/
// #include <dos>
using namespace std;
#define COUNT 10
class node
{
public:
    int num;
    node *left, *right;
    node(int data) : num(data){};
    node();
    // ~node();
};
node::node()
{

    num = 0;
    left = NULL;
    right = NULL;
}
void creat(node *&tree, int key)
{
    if (tree == NULL)
    {
        tree = new node();
        tree->num = rand() % 100;
        key--;
    }
    if (key > 3)
    {
        queue<node *> q;
        q.push(tree);
        node *x = tree;
        while (!q.empty() && key > 0)
        {
            x = q.front();
            q.pop();
            if (key >= 2)
            {
                x->left = new node();
                x->right = new node();
                x->left->num = rand() % 100;
                x->right->num = rand() % 100;
                q.push(x->left);
                q.push(x->right);
                key -= 2;
            }
        }
    }
}
// void creat_tree(node *&tre, char stp = 'D')
// {
//     if (stp != 'Q' && stp != 'q')
//     {
//         if (tre == NULL)
//         {
//             tre = new node;
//             cout << "Entre a number Please :" << endl;
//             cin >> tre->num;
//         }
//         cout << "if you want to stop than write Q :";
//         cin >> stp;
//         creat_tree(tre->left, stp);
//         creat_tree(tre->right, stp);
//     }
// }
void Display_deep(node *tre)
{
    if (tre != NULL)
    {
        cout << "the value is : " << tre->num << endl;
        Display_deep(tre->left);
        Display_deep(tre->right);
    }
}

bool search(node *tre, int val)
{
    if (tre == NULL)
        return false;
    else if (tre->num == val)
        return true;
    else
    {
        if (search(tre->left, val))
            return true;
        else
            return search(tre->right, val);
    }
}
int maxVal(node *tre)
{
    node *F;
    node *val;
    queue<node *> QT;
    QT.push(tre);
    int max = tre->num;
    while (!QT.empty())

    {
        val = QT.front();
        QT.pop();
        if (max < val->num)
            max = val->num;
        if (val->left != NULL)
            QT.push(val->left);
        if (val->right != NULL)
            QT.push(val->right);
    }
    return max;
}
int minVal(node *tre)
{
    node *val;
    queue<node *> QT;
    QT.push(tre);
    int min = tre->num;
    while (!QT.empty())
    {
        val = QT.front();
        QT.pop();
        if (min > val->num)
            min = val->num;
        if (val->left != NULL)
            QT.push(val->left);
        if (val->right != NULL)
            QT.push(val->right);
    }
    return min;
}
void insert(node *&root)
{
    // if the root is null, create a new node and return it
    if (root == NULL)
    {
        root = new node();
        root->num = rand() % 100;
        return;
    }
    else
    {
        insert(root->left);
        insert(root->right);
    }
}
void PRF(node *root, int &CPT)
{
    // if the root is null, create a new node and return it
    if (root == NULL)
    {
        CPT++;
    }
    else
    {
        insert(root->left);
        insert(root->right);
    }
}
void deletion(node *tre)
{
    if (tre != NULL)
    {
        deletion(tre->left);
        deletion(tre->right);
        delete tre;
    }
}

bool egaux(node *P1, node *P2)
{
    if (P1 == NULL && P2 == NULL)
        return true;
    else if (P1 == NULL || P2 == NULL)
        return false;
    else if (P1->num != P2->num)
        return false;
    else
    {
        bool b = egaux(P1->left, P2->left);
        if (!b)
            return false;
        else
            return egaux(P1->right, P2->right);
    }
}
void ClearArb(node *&ar)
{
    if (ar != NULL)
    {
        ar->num = -1;
        ClearArb(ar->left);
        ClearArb(ar->right);
    }
}
void print2DUtil(node *root, int space)
{
    // Base case
    if (root == NULL)
        return;

    // Increase distance between levels
    space += COUNT;

    // Process right child first
    print2DUtil(root->right, space);

    // Print current node after space
    // count
    cout << endl;
    for (int i = COUNT; i < space; i++)
        cout << " ";
    cout << root->num << "\n";

    // Process left child
    print2DUtil(root->left, space);
}

// Wrapper over print2DUtil()
void print2D(node *root)
{
    // Pass initial space count as 0
    print2DUtil(root, 0);
}
void invers(node *p1, node *&p2)
{
    if (p1 != NULL && p2 != NULL)
    {
        p2->num = p1->num;
        invers(p1->left, p2->right);
        invers(p1->right, p2->left);
    }
}
void Ajoute(node *&R, int val)
{
    if (R == NULL)
    {
        node *tree = new node;
        tree->num = val;
        tree->left = tree->right = NULL;
        R = tree;
    }
    else
    {
        if (R->num > val)
            Ajoute(R->left, val);
        else
            Ajoute(R->right, val);
    }
}
void deleting(node *&tre, node *tat)
{
    if (tre != NULL)
    {
        if (tre->left != NULL && tre->right != NULL)
        {
            deleting(tre->left, tat);
            deleting(tre->right, tat);
            if (tre != tat)
            {
                delete tre;
                tre = NULL;
            }
        }
    }
}
void INSERT(node *&tre, int rd)
{
    if (tre == NULL)
    {
        tre = new node;
        tre->num = rd;
        tre->left = NULL;
        tre->right = NULL;
    }
    else
    {
        if (rd > tre->num)
        {
            INSERT(tre->right, rd);
        }
        else
        {
            INSERT(tre->left, rd);
        }
    }
}
int NBnoeud(node *tre)
{
    if (tre->left == NULL && tre->right == NULL)
        return 0;
    else
        return NBnoeud(tre->left) + NBnoeud(tre->right) + 1;
}
void DSnoeud(node *tre)
{
    if (tre->left == NULL && tre->right == NULL)
        return;
    else
        cout << "the value is :" << endl;
}
bool Comp(node *tre, node *tre1)
{
    if (tre == NULL && tre1 == NULL)
        return true;
    else if (tre == NULL || tre1 == NULL)
        return false;
    else if (tre->left == NULL && tre->right == NULL)
    {
        if (tre->num == tre1->num)
            return true;
        else
        {
            return Comp(tre->left, tre1->left) && Comp(tre->right, tre1->right);
        }
    }
    else
        return false;
}
void ajout(node *&tre, int val)
{
    if (tre != NULL)
    {
        if (tre->num > val)
        {
            ajout(tre->left, val);
            node *tree = new node;
            tree->num = val;
            tree->left = tre->left->left;
            tree->right = tre->left->right;
            tre->left = tree;
        }
        else
        {
            ajout(tre->right, val);
            node *tree = new node;
            tree->num = val;
            tree->left = tre->left->left;
            tree->right = tre->left->right;
            tre->right = tree;
        }
    }
}
// node *insertion(node *root, int val)
// {
//     if (root == nullptr)
//     {
//         return new node(val);
//     }
//     if (root->num < val)
//     {
//         root->right = insertion(root->right, val);
//     }
//     else
//     {
//         root->left = insertion(root->left, val);
//     }
//     return root;
// }
void getMinimumKey(node *curr, node *&R)
{

    if (curr->right != NULL)
        curr = curr->right;
    while (curr->left != NULL)
    {
        curr = curr->left;
    }
    if (curr)
        R = curr;
}
void searching(node *R, int key, int &count)
{
    if (R != NULL)
    {
        if (R->num == key)
        {
            return;
        }
        if (R->num > key)
        {
            count++;
            searching(R->left, key, count);
        }
        if (R->num < key)
        {
            count++;
            searching(R->right, key, count);
        }
        return;
    }
}
int search_bst(node *R, int key, int &cpt)
{
    if (R == NULL)
    {
        return -1;
    }
    else
    {
        cpt++;
        if (R->num == key)
            return cpt;
        else if (R->num > key)
            return search_bst(R->left, key, cpt);
        else
            return search_bst(R->right, key, cpt);
    }
}
bool isSubTreeLesser(node *R, int key)
{
    if (R == NULL)
        return true;
    else if (R->num <= key && isSubTreeLesser(R->left, key) && isSubTreeLesser(R->right, key))
        return true;
    else
        return false;
}
bool isSubTreeGreater(node *R, int key)
{
    if (R == NULL)
        return true;
    else if (R->num >= key && isSubTreeGreater(R->right, key) && isSubTreeGreater(R->left, key))
        return true;
    else
        return false;
}
bool isBinarySearch(node *R)
{
    if (R == NULL)
        return true;
    if (isSubTreeLesser(R->left, R->num) && isSubTreeGreater(R->right, R->num) && isBinarySearch(R->left) && isBinarySearch(R->right))
        return true;
    else
        return false;
}
void trieTAB(int TAB[], int taill, int &i, node *R)
{
    TAB[taill];
    if (R != NULL && i < taill)
    {
        trieTAB(TAB, taill, i, R->left);
        TAB[i] = R->num;
        i++;
        trieTAB(TAB, taill, i, R->right);
    }
}
node *Truncate(node *root, int key)
{
    // base case
    if (root == NULL)
    {
        return root;
    }

    // recursively truncate the left and right subtree first
    root->left = Truncate(root->left, key);
    root->right = Truncate(root->right, key);
    node *curr = root;

    // if the root's key is smaller than the minimum allowed, delete it
    if (root->num == key)
    {
        root = root->right;
        delete curr;
    }

    return root;
}
node *searchkey(node *&curr, int key)
{
    node *parent = curr;
    while (curr != NULL && curr->num != key)
    {
        parent = curr;
        if (curr->num > key)
        {
            curr = curr->left;
        }
        else
        {
            curr = curr->right;
        }
    }
    return parent;
}
void deleteNode(node *&root, int key)
{
    node *curr = root;
    node *parent = searchkey(curr, key);
    if (curr == NULL)
        return;
    else
    {
        // first cas the pointer is feuille
        if (curr->left == NULL && curr->right == NULL)
        {
            if (curr != root)
            {
                if (parent->left == curr)
                {
                    // cout << "bug 1" << endl;
                    parent->left = NULL;
                }
                else if (parent->right == curr)
                    parent->right = NULL;
                // cout << "bug " << endl;
            }
            else
                root = NULL;
            free(curr);
        }
        // second cas the pointer has one child
        else if (curr->left == NULL || curr->right == NULL)
        {
            node *child = (curr->left != NULL) ? curr->left : curr->right;
            if (curr != root)
            {
                if (parent->left == curr)
                {
                    parent->left = child;
                }
                else if (parent->right == curr)
                {
                    parent->right = child;
                }
            }
            else
            {
                root = child;
            }
            free(curr);
        }

        // third cas the pointer has two children
        else
        {
            node *success;
            getMinimumKey(curr, success);
            int val = success->num;
            deleteNode(root, val);
            curr->num = val;
        }
    }
}
void merge(node *t1, node *t2)
{
    if (t2 && t1)
    {
        merge(t1->left, t2->left);
        if (t2->num >= 0)
        {
            INSERT(t1, t2->num);
        }
        merge(t1->right, t2->right);
    }
}
void merge1(node *&t1, node *&t2)
{
    if (t1 && t2)
    {
        merge1(t1->left, t2->left);
        if (t1->num < 0)
        {
            INSERT(t2, t1->num);
        }
        merge1(t1->right, t2->right);
    }
}
void del(node *&t1)
{
    if (t1)
    {
        del(t1->left);
        del(t1->right);
        if (t1->num < 0)
            deleteNode(t1, t1->num);
    }
}
void del2(node *&t1)
{
    if (t1)
    {
        del2(t1->left);
        del2(t1->right);
        if (t1->num >= 0)
            deleteNode(t1, t1->num);
    }
}
void principal(node *&t1, node *&t2)
{
    merge(t1, t2);
    merge1(t1, t2);
    del(t1);
    del2(t2);
}
void infix(node *R)
{
    if (R != NULL)
    {
        infix(R->left);
        cout << R->num << ", ";
        infix(R->right);
    }
}
int main(void)
{
    srand(time(0));
    int TAB[7] = {66, 76, -26, 65, -11, -4, 98};
    char s = 'Q';
    int i;
    int TAB1[7] = {22, -4, 9, -1, -2, -5};
    node *tre = NULL;
    node *tre1 = NULL;
    node *tat = NULL;
    int cpt = 0;
    do
    {
        // clrscr();
        cout << "Chose a Methode :" << endl;
        cout << "1 :: creat_tree :" << endl;
        cout << "2 :: search :" << endl;
        cout << "3 :: max val :" << endl;
        cout << "4 :: min val :" << endl;
        cout << "5 ::Affichage Profende :" << endl;
        cout << "6 :: INSERT :" << endl;
        cout << "7 :: NBnoeud " << endl;
        cout << "8 :: Egaux :: " << endl;
        cout << " 9 :: Clear Arbre :: " << endl;
        cout << "10 :: Ajout  :: " << endl;
        cout << "11 :: Inverse ::" << endl;
        cout << " 12 :: Deleting :: " << endl;
        cout << "13 : profondeur :: " << endl;
        cout << "14 :: COMP :: " << endl;
        cout << "15 :: print 2D :: " << endl;
        cout << "16 :: test si est arbre binaire " << endl;

        cout << "Etnre a numbr: ";
        cin >> i;
        '\n';
        switch (i)
        {
        case 1:
            //   cout << "Enter a Number: ";
            // cin >> i;
            for (int j : TAB)
            {
                INSERT(tre, j);
            }
            '\n';
            // creat(tre, i);
            //    creat(tre1, i);
            print2D(tre);
            cout << "\n \n \n"
                 << endl;
            //   print2D(tre1);
            // cout << "\n \n \n"
            //      << endl;
            // creat(tre1, i);
            // print2D(tre1);
            cout << "\n \n \n"
                 << endl;
            for (int j : TAB1)
            {
                INSERT(tre1, j);
            }
            print2D(tre1);
            cout << "\n \n \n"
                 << endl;
            // cpt = 0;
            // trieTAB(TAB, 7, cpt, tre);
            // for (int k : TAB)
            // {
            //     cout << "The value is " << k << endl;
            // }
            break;
        case 2:
            cout << "Entre a number to search";
            cin >> i;
            cpt = 0;
            // searching(tre, i, cpt);

            // cout << "Exist" << search_bst(tre, i, cpt) << endl;
            // else cout << "Non Existe" << endl;
            //  cout << " existe : " << cpt;
            // else
            //     cout << " n'existe pas ." << endl;
            tre1 = searchkey(tre, i);
            if (tre1 != NULL)
                cout << "Exist and your value is " << tre1->num << endl;
            else
                cout << "N' existe Pas " << endl;
            break;
        case 3:
            cout << " the max value is : " << maxVal(tre) << endl;
            break;
        case 4:
            cout << " the min value is : " << minVal(tre) << endl;
            break;
        case 5:
            Display_deep(tre);
            break;
        case 6:

            insert(tre);
            break;
        case 7:
            cout << "The Number is :: " << NBnoeud(tre) << endl;

            break;
        case 8:
            tre1 = tre;
            if (egaux(tre, tre1))
                cout << " :: EGAUX ::" << endl;
            else
                cout << "  :: NOT EQAUX :: " << endl;
            break;
        case 9:
            //  ClearArb(tre);
            cout << "Entr a Value : ";
            cin >> i;
            '\n';
            tre1 = Truncate(tre, i);
            break;
        case 10:
            cout << "Enter a Number to Insert : ";
            cin >> i;
            //  tre = insertion(tre, i);
        case 11:
            ClearArb(tre1);
            invers(tre, tre1);
            break;
        case 12:
            cout << "Entre a val to delete please :";
            cin >> i;
            '\n';

            // deleting(tre, tat);
            deleteNode(tre, i);
            break;
        case 13:
            PRF(tre, cpt);
            cout << "Profondeur est :: " << cpt << endl;
            break;

        case 14:
            if (Comp(tre, tre1))
                cout << ":True:" << endl;
            else
                cout << "::False::" << endl;
            break;
        case 15:
            print2D(tre);
            cout << "\n \n \n"
                 << endl;
            print2D(tre1);
            cout << "\n \n \n"
                 << endl;
            break;
        case 16:
            if (isBinarySearch(tre))
                cout << "Yes it is BST" << endl;
            else
                cout << "No isn't " << endl;
            break;
        case 17:
            infix(tre);
            '\n';
            break;
        case 20:
            principal(tre, tre1);
            break;
        default:
            cout << "Error \n";
            break;
        }
        '\n';
        cout << "Tapez Q pour quitez :";
        cin >> s;
        cout << endl;

    } while (s != 'Q' && s != 'q');
}
