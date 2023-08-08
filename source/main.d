import std.stdio;
import bindbc.glfw;
import core.thread.osthread;
import core.time;

int main()
{
	GLFWSupport ret = loadGLFW();
	if(ret != glfwSupport) {

		writeln("GLFW shared library failed to load");

		if(ret == GLFWSupport.noLibrary) {
			writeln("Library not found");
		}
		else if(GLFWSupport.badLibrary) {
			writeln("One or more symbols failed to load. Wrong version.");
		}
		return -1;
	}

	if (!glfwInit())
	{
		writeln("GLFW initialization failed");
		return -1;
	}

	GLFWwindow* window = glfwCreateWindow(640, 480, "Infinity Space Shooter", null, null);
	if (!window)
	{
		writeln("Window or OpenGL context creation failed");
		return -1;
	}

	static frameDuration = dur!("msecs")(17);

	while (!glfwWindowShouldClose(window))
	{
		Thread.sleep(frameDuration);
		glfwSwapBuffers(window);
		glfwPollEvents();
	}

	glfwDestroyWindow(window);
	glfwTerminate();
	return 0;
}