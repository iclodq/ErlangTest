double findKey2(int* nums1, int nums1Size, int* nums2, int nums2Size,int mid)
{
    int i=1,p1=0,p2=0;
    if (nums1Size==0)
        return nums2[mid-1];
    else if(nums2Size==0)
        return nums1[mid-1];
    while(i<=mid)
    {
        if (p1 <= (nums1Size-1) && (p2>=nums2Size || nums1[p1] <= nums2[p2]))
        {
            if(i==mid)
                return nums1[p1];
            p1++;
            i++;
        }
        else
        {
            if(i==mid)
                return nums2[p2];
            p2++;
            i++;
        }
    }
    return 0;
}

double findKey(int* nums1, int nums1Size, int* nums2, int nums2Size,int mid)
{
    if (nums1Size==0)       //只有1个数组,直接取O(1)
        return nums2[mid-1];
    else if(nums2Size==0)
        return nums1[mid-1];
    int p1=0,l1=0,r1=nums1Size-1,p2=0,l2=0,r2=nums2Size-1,m=0;
    m = (p1+p2)/2,
    while(1)
    {
        if(nums1[p1]<=nums2[p2])
        {
            if(p1+p2+2==mid)
                return nums1[p1];
            else if(p1+p2+2<mid)
                p1=(p1+r1)/2;   //p1右移
            else
                p2=(p2+l1)/2;   //p2左移
        }
        else
        {   // nums1[p1]>nums2[p2]
            if(p1+p2+2==mid)
                return nums2[p2];
            else if(p1+p2+2<mid)
                p2=(p2+r2)/2;   //p2右移
            else
                p1=(p1+l1)/2;   //p1左移
        }
    }
}



double findMedianSortedArrays(int* nums1, int nums1Size, int* nums2, int nums2Size) {

    int size = nums1Size+nums2Size;
    if(size & 0x1)
        return findKey(nums1,nums1Size,nums2,nums2Size,size/2+1);
    else
        return (findKey(nums1,nums1Size,nums2,nums2Size,size/2) +
        findKey(nums1,nums1Size,nums2,nums2Size,size/2+1))/2.0;
}




