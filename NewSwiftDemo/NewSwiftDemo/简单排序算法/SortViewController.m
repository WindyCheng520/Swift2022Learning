//
//  SortViewController.m
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/1.
//

#import "SortViewController.h"
#include <stdio.h>
#include<stdlib.h>
#include <sys/time.h>
#include <unistd.h>

@interface SortViewController ()

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    int a[] = {1, 20, 4, 100, 15, 3};
//    BublleSort(a, 6); //冒泡
//    InsertSort(a, 6);   //插入
//    insert(a, 6);
//    SelectSort(a, 6);
//    selectsort(a, 6);
//    Traverse(a, 6);//输出排序后的数组
//    swap3(10000, 99);
    
//    output(20);
    
    method();
}

/**********遍历输出数组元素*************/
void Traverse(int arr[], int count)
{
    int i;
    printf("数组输出: ");
    for(i = 0; i < count; i++ )
    printf("%d\t", arr[i]);
    printf("\n");
}

/*冒泡排序：
思路：将相邻的两个数比较，将较小的数调到前头；有n个数就要进行n-1趟比较，第一次比较中要进行n-1次两两比较，在第j趟比较中，要进行n-j次两两比较。
 */
void BublleSort (int arr [], int count)
{
    int i, j, temp;
    for(j = 0; j< count-1; j++ ){ /* 冒泡法要排序n-1次*/
        for(i = 0; i< count - j - 1; i ++)/* 值比较大的元素沉下去
    后，只把剩下的元素中的最大值再沉下去就可以啦 */
        {
            if(arr[i]>arr[i + 1])/* 把值比较大的元素沉到底 */
            {
                temp = arr[i + 1];
                arr[i + 1] = arr[i];
                arr[i] = temp;
            }
        }
    }
}


/*插入排序：
思路：在得到要排序的数组以后，讲数组分为两个部分，数组的第一个元素为一个部分，剩下的元素为一部分，然后从数组的第二个元素开始，和该元素以前的所有元素比较，如果之前的元素没有比该元素大的，那么该元素的位置不变，如果有元素的值比该元素大，那么记录相爱他所在的位置；例如I，该元素的位置为k，则将从i到k位置上的所有元素往后移动一位，然后将k位置上的值移动到i位置上。这样就找到了K所在的位置。每一个元素都这样进行，最终就会得到排好顺序的数组。
 */

void InsertSort ( int arr[],int count)
{
    int i,j,temp;
    for(i = 1; i < count; i++ )//数组分两个部分，从第二个数组元素开始
    {
        temp = arr[i];    //操作当前元素(将要插入的元素)，先保存在其它变量中
        for(j = i; j > 0 && arr[j -1] > temp; j--)//从当前元素的上一个元素开始查找合适的位置，一直查找到首元素
        {
            arr[j] = arr[j - 1]; //移动元素的位置.供要插入元素使用
        }
        
        arr[j] = temp;   //插入需要插入的元素
    }
}

void insert(int *a,int n)
{
    int i,j,key;
    for(i=1;i<n;i++)//控制需要插入的元素
    {
        key=a[i]; //key为要插入的元素
        for(j=i;j>0 && a[j-1]>key;j--) //查找要插入的位置,循环结束,则找到插入位置
        {
            a[j] = a[j-1]; //移动元素的位置.供要插入元素使用
        }
        a[j] = key; //插入需要插入的元素
        
    }
}

/*选择排序：
思路：
首先以一个元素为基准，从一个方向开始扫描，比如从左到右扫描，以A[0]为基准，接下来从A[0]….A[9]中找出最小的元素，将其与A[0]交换。然后将其基准位置右移一位，重复上面的动作，比如，以A[1]为基准，找出A[1]~A[9]中最小的，将其与A[1]交换。一直进行到将基准位置移到数组最后一个元素时排序结束。
实现代码：
*/
// 用于对数组进行选择排序法操作
// 参数a为需要排序的数组
// 参数n为需要排序数组的元素个数
void selectsort(int *a,int n)
{
    int i;
    int j;
    int temp = 0;
    int flag = 0;
    for(i = 0; i < n - 1; i++)    // 大循环，用于控制程序不再对已经排好序的数进行操作
    {
        temp = a[i];
        flag = i;
        for(j = i + 1; j < n; j++)  // 小循环，用于从前往后扫描数组并选择最小数
        {
            if(a[j] < temp)
            {
                temp = a[j];
                flag = j;        // 目前最小的元素的下标
            }
        }
        if(flag != i)      // 如果最小的元素不是进行筛选的数据中的第一个，则将最小数据与第一个筛选数据交换
        {
            a[flag] = a[i];
            a[i] = temp;
        }
    }
}


void swap1(int a,int b)
{
    //方法一：
    a = a + b;
    b = a - b;
    a = a - b;
    printf("a = %d\t,b =%d\n",a,b);
    
}

void swap2(int a,int b)
{
    //方法二：
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;
    printf("a = %d\t,b =%d\n",a,b);
}


//不通用
void swap3(int a,int b)
{
    //方法三： //b 不能为0
    a = a * b;
    b = a / b;
    a = a / b;
    
}

//递归方式实现斐波那契数列
int feibonaqie(int n)
{
    if (n == 1 || n == 2)
        return 1;
   
        return feibonaqie(n - 1) + feibonaqie(n - 2);
}

//非递归方式实现斐波那契数列
int feibonaqie2(int n)
{
    int num1 = 1;
    int num2 = 2;
    
    int  temp = 0;
    if (n < 3) {
        return 1;
    }else{
        for (int i = 0; i <= 3;  i++) {
            temp = num1 + num2;
            num1 = num2;
            num2 = temp;
        }
        return temp;
    }
    
}


//指针数组方式实现斐波那契数列
//展示打印(数组）
void Show(int *arr, int len){
    for (int i = 0; i < len; i ++) {
        printf("%5d  ", arr[i]);
    }
    printf("\n");
}


//生成
void feibonaqie3(int *arr, int  len)
{
    arr[0] = 1;
    arr[1] = 1;
    for(int i = 0; i < len; i ++){
        arr[i] = arr[i - 1] + arr[i - 2];
    }
}

////调用生成数组
//int main()
//{
//    int brr[10] = {};
//    int len = sizeof(brr)/sizeof(brr[0]);
//    feibonaqie3(brr, len);
//    Show(brr, len)
//}


void output(int n)
{
    int i;
    for (i = 0; i < n + 1; i++)         //输出所有项
    {
        printf("%d, ", feibonaqie(i + 1));
        if (i != 0 && i%5 == 0)     //每五项进行一次换行（第一行多一个第0项）
            printf("\n");
    }
    printf("第 %d 项是：%d\n", n, feibonaqie(n)); //输出要求
}

void method(void)
{
//    int a1 ,a2,a5,a10,a20,a50,a100, a200;
//    int f2 = 200;
//    int f1 = 100;
//
//    int count=0,i_p1,i_p2,i_p5,i_p10,i_p20,i_p50,i_f1,i_f2;
//    for(i_p1=0; i_p1<=f2; i_p1++)
//    {
//        for(i_p2=0; i_p2<=f1; i_p2++)
//        {
//            if(i_p1*p1+i_p2*p2>f2)break;
//            for(i_p5=0; i_p5<=40; i_p5++)
//            {
//                if(i_p1*p1+i_p2*p2+i_p5*p5>f2)break;
//                for(i_p10=0; i_p10<=p20; i_p10++)
//                {
//                    if(i_p1*p1+i_p2*p2+i_p5*p5+i_p10*p10>f2)break;
//                    for(i_p20=0; i_p20<=p10; i_p20++)
//                    {
//                        if(i_p1*p1+i_p2*p2+i_p5*p5+i_p10*p10+i_p20*p20>f2)break;
//                        for(i_p50=0; i_p50<=4; i_p50++)
//                        {
//                            if(i_p1*p1+i_p2*p2+i_p5*p5+i_p10*p10+i_p20*p20+i_p50*p50>f2)break;
//                            for(i_f1=0; i_f1<=2; i_f1++)
//                            {
//                                if(i_p1*p1+i_p2*p2+i_p5*p5+i_p10*p10+i_p20*p20+i_p50*p50+i_f1*f1>f2)break;
//                                for(i_f2=0; i_f2<=1; i_f2++)
//                                {
//                                    if(i_p1*p1+i_p2*p2+i_p5*p5+i_p10*p10+i_p20*p20+i_p50*p50+i_f1*f1+i_f2*f2==f2)
//                                    {
//                                        count++;
//                                        printf("%d\t1:%d2:%d5:%d10:%d20:%d50:%df1:%df2:%d\n",count,i_p1,i_p2,i_p5,i_p10,i_p20,i_p50,i_f1,i_f2 );
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//    printf("%d\n",count);
}




@end
