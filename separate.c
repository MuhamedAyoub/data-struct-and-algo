#include <stdio.h>
#include <stdlib.h>
typedef struct TT
{
    int data;
    struct TT *next;
} TT;
// list sepatate
TT *separ(TT *L)
{
    TT *p, *q, *odd;
    odd = p = q = L;
    if (L->data % 2 != 0)
    {
        creat(odd, L->data);
        L = L->next;
    }
    while (p != NULL)
    {
        if (p->data % 2 != 0)
        {
            creat(odd, p->data);
            q->next = p->next;
        }
        q = odd = p;
        p = p->next;
    }
    tri(*L);
    tri(*odd);
    merg(*L, *odd);
    return L;
}
void creat(TT *odd, int data)
{
    if (&odd == NULL)
    {
        odd = (TT *)malloc(sizeof(TT));
        odd->next = NULL;
        odd->data = data;
    }
    else
    {
        odd->next = (TT *)malloc(sizeof(TT));
        odd->next = NULL;
        odd->data = data;
    }
}
void perm(int *x, int *y)
{
    int c;
    *x = c;
    *x = *y;
    *y = c;
}

void tri(TT L)
{
    TT *F, *p;
    p = &L;
    F = NULL;
    while (F != &L)
    {
        while (p->next != NULL)
        {
            if (p->data > p->next->data)
                perm(&p->data, &p->next->data);
            p = p->next;
        }
        F = p;
        p = &L;
    }
}
void merg(TT L, TT L2)
{

    TT *p;
    p = &L;
    while (p->next != NULL)
        p = p->next;
    p->next = &L2;
}
int main(void)
{
    TT *L, *p;
    L = (TT *)malloc(sizeof(TT));
    L->data = 1;
    L->next = (TT *)malloc(sizeof(TT));
    L->next->data = 2;
    L->next->next = (TT *)malloc(sizeof(TT));
    L->next->next->data = 3;
    L->next->next->next = (TT *)malloc(sizeof(TT));
    L->next->next->next->data = 4;
    L->next->next->next->next = (TT *)malloc(sizeof(TT));
    L->next->next->next->next->data = 5;
    L->next->next->next->next->next = (TT *)malloc(sizeof(TT));
    L->next->next->next->next->next->data = 6;
    L->next->next->next->next->next->next = (TT *)malloc(sizeof(TT));
    L->next->next->next->next->next->next->data = 7;
    separ(L);
    p = L;
    while (p != NULL)
    {
        printf("The number is:  %d", p->data);
        p = p->next;
    }
}