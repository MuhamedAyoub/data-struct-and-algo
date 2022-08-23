#include <iostream>
#include <stack>
#include <algorithm>
using namespace std;

void INSCS(stack<int> &st, int item)
{
    if (st.empty())
    {
        st.push(item);
    }
    else
    {
        int top = st.top();
        st.pop();
        INSCS(st, item);
        st.push(top);
    }
}
void reverse(stack<int> &st)
{
    if (!st.empty())
    {
        int top = st.top();
        st.pop();
        reverse(st);
        INSCS(st, top);
    }
}
int main(void)
{
    stack<int> st;
    for (int i = 1; i <= 5; i++)
        st.push(i);
    reverse(st);
    while (!st.empty())
    {
        cout << "The value is : " << st.top() << endl;

        st.pop();
    }
}