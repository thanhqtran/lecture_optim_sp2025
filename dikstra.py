import heapq

pq = []

def dikstra(graph, start):
  path_cost = {edge: float("inf") for edge in graph}
  path_cost[start] = 0
  pq = [(start,0)]
  while pq:
    edge, distance = heapq.heappop(pq)
    if distance > path_cost[edge]:
       continue
    for neighbour, weight in graph[edge]:
      cur_dis = distance + weight
      if cur_dis < path_cost[neighbour]:
        path_cost[neighbour] = cur_dis
        heapq.heappush(pq, (neighbour, cur_dis))
  return path_cost

graph={
  'A': [('B',2), ('C',5)],
  'B': [('A',2), ('C',1), ('D',4)],
  'C': [('A',5),('B',1),('D',2),('E',3)],
  'D': [('B',4),('C',2),('E',1)],
  'E': [('C',3),('D',1)]
}

start = 'A'
destination = 'E'
distances = dikstra(graph, start)
print(distances)
