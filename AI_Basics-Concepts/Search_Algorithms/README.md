## AI-Search Algorithms

1. Breadth First Search (Uninformed).

2. A* Search (Informed).

•	searchGeneric.py is a python file that contains common generic search algorithms. The file contains BFS and A* search algorithms with supporting classes and methods. A-Star search algorithm uses “searcher” class iteratively to find the optimal path.

•	A-Star search algorithm in searchGeneric.py is executing and finding the optimal solution using iterative execution of “searcher” class, It does not using multi-path checking to reach the goal state. 

•	The python file searchMPP.py is inherited to searchGeneric.py, which executing independent of the method “searcher”.

•	Unlike A-Star search algorithm in searchGeneric.py, it is using multi-path checking to find the most optimum solution I think.

•	searchMPP.py may be faster than searchGeneric.py in terms of finding the solution.

•	The MPP is having an array of explored nodes in the memory to check for cyclic paths and to avoid search repetition.

By default, searchGeneric.py is designed to implement DFS search. DFS which uses the LIFO techniques need to be replace with FIFO method in order to execute the BFS algorithm. In this program class “FrontierPQ” need to reconfigure to implement the BFS. So we need to remove the “heappush” operation defined inside the “add” function and initialize the “frontierpq” queue. In the next step we will define – “(_, _, path) = self.frontierpq.pop()” instead of “heapq.heappop(self.frontierpq”. The self.frontierpq.pop() will change the LIFO method into FIFO.
