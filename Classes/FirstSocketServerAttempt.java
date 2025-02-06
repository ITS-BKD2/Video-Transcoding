//package videoTranscoding.something
//
//This code was handwritten using Vim, and as such needs to be integrated with
//the rest of the Sprint Microservice

import java.io.IOException;
import java.io.PrintWriter;
import java.net.BindException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;
import java.util.concurrent.TimeUnit;


//The server was made with dynamic port binding in mind, as the startServer
//function increments the integer passed to it every time it finds a port that
//is already in use. This may cause problem with containerization, and as such
//should be changed if dynamic port binding cannot happen for whatever reason
//It should be noted that the dynamic port binding ONLY happens when the first
//integer passed corresponds to an already busy port, so as long as the other
//service pass correct arguments this could be avoided with the proper
//docker.config
//Still it is a but of an experiment
//Following a version of startServer without increments, written with Vim.
//(be wary of spelling mistakes)
/*
public int startServer(int portNumber) throws IOException {
  int currentPort= portNumber;
  for(;;) {
    try {
      serverSocket = new ServerSocket(currentPort);
      this.port = currentPort;
      break; //breaks when the port has been bound succesfully
    } catch (BindException e) {
        throw new IOException("The port is already busy or the binding was unsuccesfull");
    }
  }
  new Thread(this::serverLoop).start(); //opens a thread, could be turned into
                                        //a virtual thread for better
                                        //scalability
  return this.port;
}
*/
public class FirstSocketServerAttempt {
	private ServerSocket serverSocket;
	private int port; //= 8080;

	public int startServer(int portNumber) throws IOException {
		if (portNumber < 1024 || portNumber >= 49151) {
			throw new IllegalArgumentException("Port muste be between 1024 and 49151");
		}
		int currentPort = portNumber;
        while (true) {
            try {
                serverSocket = new ServerSocket(currentPort);
                this.port = currentPort;
                break; //breaks when the port has been bound succesfully
            } catch (BindException e) {
				// Port is busy, try the next one
				currentPort++;
                if (currentPort > 65535) {
					throw new IOException("No valid ports available");
				}
            }
        }
		new Thread(this::serverLoop).start();  //opening a Thread allow the main to continue while the socket server runs on its own thread. May introduce overhead

		return this.port;
    }


	private void serverLoop() {
		System.out.println("Server started at " + port);
		try {
			while(true) {
				try (Socket socket = serverSocket.accept()) {
					System.out.println("Server has started listening");
					//TESTING ONLY TODO CANCEL BEFORE SHIPPING
					System.out.println("Wait");
					TimeUnit.SECONDS.sleep(5);

					PrintWriter out = new PrintWriter(socket.getOutputStream(), true);

					System.out.println(new Date().toString());
					System.out.println("Data Sent");
				}
			}
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
	}

	//Close the server

	public void stopServer() {
		if (serverSocket != null && !serverSocket.isClosed()) {
			try{
				serverSocket.close();
				System.out.println("Server stopped");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	//TESTING ONLY
	public static void main(String[] args) throws IOException, InterruptedException {
		FirstSocketServerAttempt server = new FirstSocketServerAttempt();
		int usedPort = server.startServer(8080); //start with port 8080, can be changed
		System.out.println("Socket server started on port: "+ usedPort);
	}


}

/*
 * Spring stuff:
 *
 * @Autowired
 * private ResourceLoader resourceLoader;
*/

