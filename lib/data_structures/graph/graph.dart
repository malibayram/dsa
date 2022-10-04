class Vertex<T> {
  const Vertex(this.data, this.index);

  final T data;
  final int index;

  @override
  operator ==(Object other) => other is Vertex<T> && other.data == data;

  @override
  int get hashCode {
    return data.hashCode;
  }
}

class Edge<T, W> {
  const Edge(this.source, this.destination, [this.weight]);

  final Vertex<T> source;
  final Vertex<T> destination;
  final W? weight;

  @override
  operator ==(Object other) {
    return other is Edge<T, W> &&
        other.source.data == source.data &&
        other.destination.data == destination.data &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    return source.data.hashCode + destination.data.hashCode + weight.hashCode;
  }
}

abstract class Graph<T, W> {
  Vertex<T> createVertex(T data);
  void addEdge(Vertex<T> source, Vertex<T> destination, [W? weight]);
  void updateEdge(Edge<T, W> edge);
  void removeVertex(Vertex<T> vertex);
  void displayGraph();
  void dfs(Vertex<T> vertex);
}

/*

Basic Operations on Graphs
Below are the basic operations on the graph:

- Insertion of Nodes/Edges in the graph – Insert a node into the graph.
- Deletion of Nodes/Edges in the graph – Delete a node from the graph.
Searching on Graphs – Search an entity in the graph.
Traversal of Graphs – Traversing all the nodes in the graph.
 
*/

class AdjacencyList<T, W> implements Graph<T, W> {
  AdjacencyList({this.directed = false});

  final bool directed;

  final _vertices = <Vertex<T>, List<Edge<T, W>>>{};

  @override
  Vertex<T> createVertex(T data) {
    final vertex = Vertex(data, 0);

    _vertices[vertex] = <Edge<T, W>>[];

    return vertex;
  }

  @override
  void addEdge(Vertex<T> source, Vertex<T> destination, [W? weight]) {
    final notContains = _vertices[destination]!
        .where((e) => e.destination.data == source.data)
        .isEmpty;
    if (notContains) {
      _vertices[source]!.add(Edge(source, destination, weight));
    }
    if (!directed) {
      if (notContains) {
        _vertices[destination]!.add(Edge(destination, source, weight));
      }
    }
  }

  @override
  void displayGraph() {
    for (final vertex in _vertices.keys) {
      var output = '${vertex.data}\t';
      for (final edge in _vertices[vertex]!) {
        output += '-> ${edge.destination.data}: ${edge.weight}\t';
      }
      print(output);
    }
  }

  @override
  void removeVertex(Vertex<T> vertex) {
    _vertices.remove(vertex);
    for (final v in _vertices.keys) {
      _vertices[v]!.removeWhere((e) => e.destination.data == vertex.data);
    }
  }

  @override
  void updateEdge(Edge<T, W> edge) {
    // TODO: implement updateEdge
  }

  @override
  void dfs(Vertex<T> vertex) {
    // TODO: implement dfs
  }
}

class AdjacencyMatrix<T, W> implements Graph<T, W> {
  AdjacencyMatrix({this.directed = false});

  final bool directed;

  final vertices = <Vertex<T>>[];
  final weights = <List<W?>>[];

  int _nextIndex = 0;

  @override
  Vertex<T> createVertex(T data) {
    final vertex = Vertex(data, _nextIndex++);
    vertices.add(vertex);
    weights.add([]);

    return vertex;
  }

  @override
  void addEdge(Vertex<T> source, Vertex<T> destination, [W? weight]) {
    for (int i = 0; i < _nextIndex; i++) {
      while (weights[i].length < _nextIndex) {
        weights[i].add(null);
      }
    }

    weights[source.index][destination.index] = weight;

    if (!directed) {
      weights[destination.index][source.index] = weight;
    }
  }

  @override
  void displayGraph() {
    print("\t${vertices.map((e) => e.data).join('\t')}");

    for (var i = 0; i < _nextIndex; i++) {
      final vertex = vertices[i];
      final weight = weights[i];

      String row = '${vertex.data}';

      for (var j = 0; j < _nextIndex; j++) {
        row += "\t${weight[j]}";
      }
      print(row);
    }
  }

  @override
  void removeVertex(Vertex<T> vertex) {
    final v = vertices.indexOf(vertex);
    vertices.removeAt(v);
    weights.removeAt(v);

    _nextIndex--;
    for (var i = 0; i < _nextIndex; i++) {
      weights[i].removeAt(v);
    }
  }

  @override
  void updateEdge(Edge<T, W> edge) {
    // TODO: implement updateEdge
  }

  final visited = <T>[];
  int routeLength = 0;

  @override
  void dfs(Vertex<T> vertex) {
    for (int i = 0; i < weights.length; i++) {
      if (weights[vertex.index][i] != null &&
          !visited.contains(vertices[i].data)) {
        routeLength += weights[vertex.index][i] as int;
        print(
            "vertex.data: ${vertex.data} -> ${vertices[i].data} : $routeLength");
        visited.add(vertex.data);
        if (i == vertex.index) {
          continue;
        }
        dfs(vertices[i]);
      }
    }
  }
}

final isteklerR = [];
final isteklerS = [];

final kullanicilar = ["Ali", "Ahmet", "Baran"];

final kullaniciIliskileri = [
  [null, null],
  [null, null],
];

final kullaniciTakip = {
  "Ali-Ahmet": true,
  "Ahmet-Ali": false,
};

final kullaniciIliskileriMap = {
  "Ali": [],
  "Ahmet": [],
};

/* 
null = kullanicilar arasi iliski yok
1 = kullanicilar arasi iletişim isteği var
2 = kullanicilar arasi iletişim isteği kabul edildi
 */

final istekler = [
  [1, 4],
  [4, 2],
];

final arkadasliklar = [
  [1, 2],
  [3, 4],
  [4, 3],
  [2, 3],
];

void main() {
  final diyarIlceler = AdjacencyMatrix<String, int>(directed: false);

  final ilce1 = diyarIlceler.createVertex('Bismil');
  final ilce2 = diyarIlceler.createVertex('Ergani');
  final ilce3 = diyarIlceler.createVertex('Kulp');
  final ilce4 = diyarIlceler.createVertex('Hani');

  diyarIlceler.addEdge(ilce1, ilce2, 110);
  diyarIlceler.addEdge(ilce2, ilce3, 160);
  diyarIlceler.addEdge(ilce3, ilce4, 70);
  diyarIlceler.addEdge(ilce1, ilce4, 100);

  diyarIlceler.displayGraph();
  diyarIlceler.dfs(ilce4);

  print('\n');

  diyarIlceler.removeVertex(ilce4);

  diyarIlceler.displayGraph();
}
