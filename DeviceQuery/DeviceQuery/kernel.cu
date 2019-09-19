#include <cuda_runtime.h>
#include <device_launch_parameters.h>

#include <iostream>
using namespace std;

int main()
{
	int count;
	cudaGetDeviceCount(&count);
	cudaDeviceProp prop;
	for (int i = 0; i < count; ++i)
	{
		cudaGetDeviceProperties(&prop, i);

		count << "Device" << i << ":" << prop.name << endl;

		count << "Compute capability:" << prop.major << "." << prop.minor << endl;
		count << "Max Grid dimensions: (" <<
			prop.maxGridSize[0] << "x" <<
			prop.maxGridSize[1] << "x" <<
			prop.maxGridSize[2] << "x）" << endl;

		count << "Max block dimensions: (" <<
			prop.maxThreadsDim[0] << "x" <<
			prop.maxThreadsDim[1] << "x" <<
			prop.maxThreadsDim[2] << "x)" << endl;

		getchar()
		return 0;

	}

}