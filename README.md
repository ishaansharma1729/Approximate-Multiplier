# Approximate-Multiplier
I have implemented a simple 4x4 approximate multiplier in Verilog based on dadda algorithm with approximate compression scheme.

We start by constructing a partial product tree, and then compressing each column to generate the final product.
We use an approximate 4:2 compressor based on [1] to compress the 3rd and 4th columns. Exact Full Adders and Half Adders are used for further compressions.
The approximate compressor takes in 4 inputs and gives only 2 outputs (this is in contrast to exact compressors which have an additional carry).

The compact nature of this compressor reduces the number of LUTs required for building the 4x4 multiplier down to 12, from the traditional requirement of 16. Hence, we get good results in terms of LUT reduction without having to compromise with further approximations such as truncations or partial product modifications.

In order to evaluate the performance of our multiplier, we find its Mean Relative Error, which is the average of the percentage error over all input cases.

![image](https://github.com/user-attachments/assets/587c2e32-c540-4d26-b284-b5cec29ffb2b)
![image](https://github.com/user-attachments/assets/4eae6973-97c9-4910-8d70-ba2e95ef11d8)

As shown in the simulation results above, our MRE stands at 13.04%.

![image](https://github.com/user-attachments/assets/fbcfb448-8d56-44c6-b48e-10cff79140e0)

The LUT usage has been brought down to 12.

![image](https://github.com/user-attachments/assets/b2b3c6dd-7b71-460b-8a06-3d4777336c0f)

References:
[1] https://ieeexplore.ieee.org/document/10073562
