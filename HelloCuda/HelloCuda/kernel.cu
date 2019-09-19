#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <stdio.h>

__global__   addArray(int *a, int *b, int *c, int count) {

	int i = threadIdx.x;
	c[i] = a[i] + b[i];

#if 0
	for (int i = 0; i < count; ++i)
		c[i] = a[i] + b[i];
#endif


}

void main() {

	const int count = 5;
	const int size = count * sizeof(int);
	int ha[] = { 1,2,3,4,5};
	int hb[] = { 10,20,30,40,50 };
	int hc[count];

	//cuda var in gpu
	int *da, *db, *dc;
	cudaMalloc(&da, size);
	cudaMalloc(&db, size);
	cudaMalloc(&dc, size)


		cudaMemcpy(da, ha, size, cudaMemcpyHostToHost);
		cudaMemcpy(db, hb, size, cudaMemcpyDeviceToHost);

	addArray <<<1, count >>> (da, db, dc);

	cudaMemcpy(hc, dc, size, cudaMemcpyDeviceToHost);
	


	for (int i = 0; i < count; ++i)
	{
		printf("%d", hc[i]);
	}
	getchar();
	
}