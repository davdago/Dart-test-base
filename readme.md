
# Dart Base

## Struttura cartelle

* .vscode 
    - La cartella .vscode in un progetto contiene configurazioni per Visual Studio Code. Il file launch.json specifica le impostazioni per l'avvio e il debug dell'applicazione Dart. Nel nostro esempio, la configurazione "Dart-Base" definisce un'istanza di avvio standard. Ogni qual volta avvieremo il debugger selezionando "Dart-Base" verrà eseguito il codice all'interno della nostra funzione main()

* common
    - La cartella "common" contiene varie sottocartelle, tra cui le principali:     
        - "functions" che contiene funzioni riusabili o utilità che possono essere richiamate in diverse parti del codice.
        - "models" per le classi di dati dell'applicazione. 


* lib 
    - La cartella "lib" contiene il codice sorgente principale dell'applicazione. Il file "main.dart" serve come punto di ingresso, avviando l'esecuzione del programma. Questo file contiene l'inizializzazione dell'applicazione, importazioni di moduli o pacchetti necessari e la chiamata alla funzione principale main(), che avvia il programma.




## Files importanti
#### Pubspec.yaml

Il file pubspec.yaml è un file di configurazione per un progetto Dart. Ecco una descrizione di alcuni degli elementi chiave:

- **name**: Il nome del progetto è "dart_base", un identificatore univoco per distinguere il progetto.

- **description**: Fornisce una breve descrizione del progetto, che aiuta a comprendere lo scopo o la funzione dell'applicazione o della libreria.

- **version**: Indica la versione corrente del progetto, in questo caso "1.0.0".

- **publish_to**: Specifica il luogo in cui il pacchetto sarà pubblicato. In questo esempio, è impostato su "none", indicando che il pacchetto non sarà pubblicato su pub.dev

- **environment**: Stabilisce le versioni minime e massime del runtime Dart compatibili con il progetto.

- **dependencies**: Elencati sotto questa sezione ci sono i pacchetti o le librerie di cui il progetto dipende. Ad esempio, json_serializable e json_annotation sono dipendenze esterne necessarie, mentre **common** è una dipendenza interna al progetto, definita con un percorso relativo (ps. osserva bene la cartella common, anche quella contiene un file pubspec.yaml ed un file common.dart). 

    Grazie a questo possiamo importare ed usare nel nostro codice non solo utilities di librerie esterne, ma anche le **nostre classi**.

- **dev_dependencies**: Questa sezione elenca le dipendenze necessarie solo durante lo sviluppo, come build_runner, lints e test.

Quando esegui il comando 
```dart pub get``` nella directory del progetto, Dart scaricherà automaticamente le dipendenze specificate in questo file.





--------------------------------------------------------------------

--------------------------------------------------------------------



# JSON Serializable Esempio

La cartella common/lib/models contiene un esempio di utilizzo della libreria `json_serializable` in Dart per semplificare la serializzazione e deserializzazione di oggetti da e verso JSON.

## Dipendenze necessarie

All'interno del nostro `pubspec.yaml` troveremo queste dipendenze fondamentali:

```yaml
dependencies:
  json_serializable: ^6.6.1
  json_annotation: ^4.8.0

dev_dependencies:
  build_runner: ^2.3.3 
```

## Definizione della Classe

Crea una classe Dart con le annotazioni `@JsonSerializable()`, specificando eventuali opzioni desiderate come `explicitToJson` o `includeIfNull`. Importa il package `json_annotation.dart` e assicurati di includere il percorso per file che verrà generato `part 'example.g.dart';`.

```dart
import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Person {
  String firstName;
  String lastName;
  final int? age;

  Person({required this.firstName, required this.lastName, this.age});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
```
## Generazione del File `example.g.dart`

Da terminale, esegui il comando:

```bash
dart run build_runner build
```
## Utilizzo della Classe

Ora puoi utilizzare la classe `Person` nel tuo codice principale, utilizzando i metodi `fromJson` e `toJson` per la conversione da e verso JSON.

```dart
void main() {
  final jsonMap = {'firstName': 'John', 'lastName': 'Doe', 'age': 30};
  final person = Person.fromJson(jsonMap);

  print('Object from JSON: $person');
  print('JSON from Object: ${person.toJson()}');
}
```
Puoi vedere un utilizzo concreto di import e uso della nostra classe di esempio, direttamente sul file **lib/main.dart**
