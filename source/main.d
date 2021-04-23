import std.stdio;
import bindbc.glfw;

void main()
{
	/*
	This version attempts to load the GLFW shared library using well-known variations
	of the library name for the host system.
	*/
	GLFWSupport ret = loadGLFW();
	if(ret != glfwSupport) {

		// Handle error. For most use cases, its reasonable to use the the error handling API in
		// bindbc-loader to retrieve error messages for logging and then abort. If necessary, it's
		// possible to determine the root cause via the return value:

		if(ret == GLFWSupport.noLibrary) {
			// GLFW shared library failed to load
		}
		else if(GLFWSupport.badLibrary) {
			// One or more symbols failed to load. The likely cause is that the
			// shared library is for a lower version than bindbc-glfw was configured
			// to load (via GLFW_31, GLFW_32 etc.)
		}
	}
	/*
	This version attempts to load the GLFW library using a user-supplied file name.
	Usually, the name and/or path used will be platform specific, as in this example
	which attempts to load `glfw3.dll` from the `libs` subdirectory, relative
	to the executable, only on Windows.
	*/
	// version(Windows) loadGLFW("libs/glfw3.dll")

	if (!glfwInit())
	{
		// Initialization failed
	}

	GLFWwindow* window = glfwCreateWindow(640, 480, "My Title", null, null);
	if (!window)
	{
		// Window or OpenGL context creation failed
	}
	while (!glfwWindowShouldClose(window))
	{
		// Keep running
	}

	glfwDestroyWindow(window);
	glfwTerminate();
}