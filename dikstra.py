import heapq

def dijkstra(graph, start):
    path_cost = {node: float("inf") for node in graph}
    path_cost[start] = 0

    prev_node = {node: None for node in graph}  # To reconstruct path

    pq = [(0, start)]

    while pq:
        distance, current = heapq.heappop(pq)

        if distance > path_cost[current]:
            continue

        for neighbor, weight in graph[current]:
            new_dist = distance + weight
            if new_dist < path_cost[neighbor]:
                path_cost[neighbor] = new_dist
                prev_node[neighbor] = current
                heapq.heappush(pq, (new_dist, neighbor))

    return path_cost, prev_node

def reconstruct_path(prev_node, start, destination):
    path = []
    current = destination
    while current is not None:
        path.append(current)
        current = prev_node[current]
    path.reverse()
    if path[0] == start:
        return path
    else:
        return None  # No path found

# in class
graph = {
    'A': [('B',2), ('D',8)],
    'B': [('A',2), ('D',5), ('E',6)],
    'D': [('A',8), ('B',5), ('E',3), ('F',2)],
    'E': [('B',6), ('D',3), ('F',1), ('C',9)],
    'F': [('D',2), ('E',1), ('C',3)],
    'C': [('E',9), ('F',3)]
}

# at home
# graph = {
#     'D': [('A', 4), ('E', 2)],
#     'A': [('D', 4), ('E', 4), ('C', 3)],
#     'E': [('D', 2), ('C', 4), ('G', 5)],
#     'C': [('A', 3), ('B', 3), ('E', 4), ('G', 5), ('F', 4)],
#     'G': [('E', 5), ('C', 5), ('F', 3)],
#     'B': [('C', 3), ('F', 2)],
#     'F': [('C', 4), ('B', 2), ('G', 3)]
# }

start = 'A'
destination = 'C'
distances, prev = dijkstra(graph, start)
shortest_path = reconstruct_path(prev, start, destination)

print("Shortest distance from D to all nodes:")
print(distances)
print(f"Shortest path from {start} to {destination}:")
print(shortest_path)
