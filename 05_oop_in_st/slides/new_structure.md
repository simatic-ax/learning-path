# OOP in ST

## Inhaltsverzeichnis
- [Inhalt / Lernziele / Zielgruppe](#inhalt--lernziele--zielgruppe)
- [Einführung in OOP](#einführung-in-oop)
  - [Definition und Grundlagen von OOP](#definition-und-grundlagen-von-oop)
  - [Motivation und Vorteile von OOP](#motivation-und-vorteile-von-oop)
  - [Historischer Hintergrund](#historischer-hintergrund)
- [Objekte und Klassen in ST](#objekte-und-klassen-in-st)
  - [Deklaration und Instanziierung von Klassen](#deklaration-und-instanziierung-von-klassen)
  - [Felder (Variablen) und Methoden](#felder-variablen-und-methoden)
  - [Zugriffsmodi (public, private, protected)](#zugriffsmodi-public-private-protected)
- [Kapselung in ST](#kapselung-in-st)
- [Vererbung in ST](#vererbung-in-st)
- [Polymorphismus in ST](#polymorphismus-in-st)
- [Abstraktion und Schnittstellen in ST](#abstraktion-und-schnittstellen-in-st)
- [Besonderheiten von OOP in ST](#besonderheiten-von-oop-in-st)
- [Zusammenfassung und Ausblick](#zusammenfassung-und-ausblick)

---
# Inhalt / Lernziele / Zielgruppe
- Zielgruppe: Teilnehmer mit geringem Vorwissen zur OOP
  - Diese Schulung richtet sich an Personen, die wenig bis keine Erfahrung mit objektorientierter Programmierung (OOP) haben und die Grundlagen erlernen möchten.
- Lernziele: Verständnis der grundlegenden OOP-Konzepte und deren Anwendung in ST
  - Die Teilnehmer sollen die grundlegenden Konzepte der OOP verstehen, wie Klassen, Objekte, Vererbung, Polymorphismus und Kapselung, und lernen, wie diese in Structured Text (ST) angewendet werden können.
---
# Einführung in OOP

----

## Definition und Grundlagen von OOP
Objektorientierte Programmierung (OOP) ist ein Programmierparadigma, das auf dem Konzept von "Objekten" basiert, die Daten und Methoden enthalten. Es ermöglicht eine strukturierte und modularisierte Programmierung.
----
## Motivation und Vorteile von OOP
OOP fördert die Wiederverwendbarkeit von Code, erleichtert die Wartung und Erweiterung von Software und ermöglicht eine bessere Modellierung der realen Welt durch die Verwendung von Objekten und Klassen.
----
## Historischer Hintergrund
OOP hat seine Wurzeln in den 1960er Jahren mit der Entwicklung von Simula, der ersten objektorientierten Programmiersprache. Später wurde das Konzept durch Sprachen wie Smalltalk, C++, und Java populär.
---

# Objekte und Klassen in ST
----
## Deklaration und Instanziierung von Klassen
In ST werden Klassen mit dem Schlüsselwort `CLASS` deklariert. Eine Instanz einer Klasse wird durch die Zuweisung zu einer Variablen erstellt.

Beispiel für die Deklarierung einer Klasse:
```st
CLASS Valve
    VAR
        isOpen : BOOL;
    END_VAR
END_CLASS
```
Beispiel für die Instanziierung und Verwendung einer Klasse:
```st
PROGRAM Main
    VAR
        myValve : Valve;
    END_VAR
END_PROGRAM
```
----
## Felder (Variablen) und Methoden
Felder sind Variablen, die innerhalb einer Klasse deklariert werden. Methoden sind Funktionen oder Prozeduren, die innerhalb einer Klasse definiert werden.
```st
CLASS Valve
    VAR
        isOpen : BOOL;
    END_VAR

    METHOD Open : BOOL
        isOpen := TRUE;
        Open := isOpen;
    END_METHOD

    METHOD Close : BOOL
        isOpen := FALSE;
        Close := isOpen;
    END_METHOD

    METHOD IsOpen : BOOL
        IsOpen := isOpen;
    END_METHOD
END_CLASS
```
---
# Kapselung
----


## Zugriffsmodi (public, private, protected)
- Zugriffsmodi bestimmen die Sichtbarkeit und den Zugriff auf Klassenmitglieder. In ST gibt es `PUBLIC`, `PRIVATE` und `PROTECTED`.
- Hinweis: Wenn `VAR` ohne Zugriffsmodifikator innerhalb einer Klasse deklariert wird, ist der Standardzugriffsmodus `PROTECTED`.
  ```st
  CLASS Valve
    VAR PUBLIC
      publicVar : INT;
    END_VAR
    VAR PRIVATE
      privateVar : INT;
    END_VAR
    VAR PROTECTED
      protectedVar : INT;
    END_VAR
    VAR
      defaultProtectedVar : INT; // Standardzugriffsmodus ist PROTECTED
    END_VAR
  END_CLASS
  ```
----
## Kapselung in ST
- Verbergen von Implementierungsdetails
  - Kapselung bedeutet, dass die internen Details einer Klasse vor dem Zugriff von außen verborgen werden. Dies schützt die Integrität der Daten und verhindert unbefugten Zugriff.
  ```st
  CLASS Valve
    VAR PRIVATE
      isOpen : BOOL;
    END_VAR

    METHOD PUBLIC Open : BOOL
      isOpen := TRUE;
      Open := isOpen;
    END_METHOD

    METHOD PUBLIC Close : BOOL
      isOpen := FALSE;
      Close := isOpen;
    END_METHOD

    METHOD PUBLIC IsOpen : BOOL
      IsOpen := isOpen;
    END_METHOD
  END_CLASS
  ```

- Bereitstellen einer öffentlichen Schnittstelle
  - Eine Klasse stellt eine öffentliche Schnittstelle bereit, durch die andere Klassen und Programme mit ihr interagieren können. Diese Schnittstelle besteht aus öffentlichen Methoden, die den Zugriff auf die internen Daten kontrollieren.
  ```st
  PROGRAM Main
    VAR
      myValve : Valve;
      valveStatus : BOOL;
    END_VAR
    myValve.Open();
    valveStatus := myValve.IsOpen(); // Zugriff über die öffentliche Schnittstelle
  END_PROGRAM
  ```

- Beispiele für gekapselte Klassen
  - Ein Beispiel für eine gekapselte Klasse ist die `Valve`-Klasse, die ihre interne Variable `isOpen` verbirgt und nur über die Methoden `Open`, `Close` und `IsOpen` zugänglich macht.
  ```st
  CLASS Valve
    VAR PRIVATE
      isOpen : BOOL;
    END_VAR

    METHOD PUBLIC Open : BOOL
      isOpen := TRUE;
      Open := isOpen;
    END_METHOD

    METHOD PUBLIC Close : BOOL
      isOpen := FALSE;
      Close := isOpen;
    END_METHOD

    METHOD PUBLIC IsOpen : BOOL
      IsOpen := isOpen;
    END_METHOD
  END_CLASS
  ```
---
## Vererbung in ST
- Ableiten von neuen Klassen aus Basisklassen
  - In ST können neue Klassen von bestehenden Basisklassen abgeleitet werden, um deren Eigenschaften und Methoden zu erben. Dies ermöglicht die Wiederverwendung von Code und die Erweiterung bestehender Funktionalitäten.
  ```st
  CLASS BaseValve
    VAR PROTECTED
      isOpen : BOOL;
    END_VAR

    METHOD PUBLIC Open : BOOL
      isOpen := TRUE;
      Open := isOpen;
    END_METHOD

    METHOD PUBLIC Close : BOOL
      isOpen := FALSE;
      Close := isOpen;
    END_METHOD

    METHOD PUBLIC IsOpen : BOOL
      IsOpen := isOpen;
    END_METHOD
  END_CLASS

  CLASS AdvancedValve EXTENDS BaseValve
    METHOD PUBLIC Toggle : BOOL
      isOpen := NOT isOpen;
      Toggle := isOpen;
    END_METHOD
  END_CLASS
  ```
----
- Überschreiben und Erweitern von Methoden
  - Abgeleitete Klassen können Methoden der Basisklasse überschreiben oder erweitern, um spezifisches Verhalten zu implementieren.
  ```st
  CLASS AdvancedValve EXTENDS BaseValve
    METHOD PUBLIC Open : BOOL
      // Erweiterung der Open-Methode
      isOpen := TRUE;
      // Zusätzliche Logik hier
      Open := isOpen;
    END_METHOD
  END_CLASS
  ```
----
- Beispiele für Vererbungshierarchien
  - Ein Beispiel für eine Vererbungshierarchie ist die `AdvancedValve`-Klasse, die von der `BaseValve`-Klasse erbt und zusätzliche Methoden wie `Toggle` implementiert.
  ```st
  PROGRAM Main
    VAR
      myValve : AdvancedValve;
      valveStatus : BOOL;
    END_VAR
    myValve.Open();
    valveStatus := myValve.IsOpen(); // Zugriff auf geerbte Methode
    myValve.Toggle();
    valveStatus := myValve.IsOpen(); // Zugriff auf erweiterte Methode
  END_PROGRAM
  ```
---
## Polymorphismus in ST
----
- Dynamisches Binden von Methoden
  - Polymorphismus ermöglicht es, dass eine Methode zur Laufzeit aufgerufen wird, basierend auf dem tatsächlichen Objekttyp. Dies wird durch das dynamische Binden von Methoden erreicht.
  ```st
  INTERFACE ItfValve
    METHOD Open : BOOL
    METHOD Close : BOOL
    METHOD IsOpen : BOOL
  END_INTERFACE

  CLASS BaseValve IMPLEMENTS ItfValve
    VAR PROTECTED
      isOpen : BOOL;
    END_VAR

    METHOD PUBLIC Open : BOOL
      isOpen := TRUE;
      Open := isOpen;
    END_METHOD

    METHOD PUBLIC Close : BOOL
      isOpen := FALSE;
      Close := isOpen;
    END_METHOD

    METHOD PUBLIC IsOpen : BOOL
      IsOpen := isOpen;
    END_METHOD
  END_CLASS

  CLASS AdvancedValve EXTENDS BaseValve
    METHOD PUBLIC Toggle : BOOL
      isOpen := NOT isOpen;
      Toggle := isOpen;
    END_METHOD
  END_CLASS
  ```
----
- Verwendung von Basisklassen-Referenzen
  - Polymorphismus wird oft durch die Verwendung von Basisklassen-Referenzen erreicht, die auf Objekte von abgeleiteten Klassen verweisen können.
  ```st
  PROGRAM Main
    VAR
      myValve : ItfValve; // Basisklassen-Referenz
      valveStatus : BOOL;
    END_VAR
    myValve := BaseValve(); // Zuweisung eines BaseValve-Objekts
    myValve.Open();
    valveStatus := myValve.IsOpen();

    myValve := AdvancedValve(); // Zuweisung eines AdvancedValve-Objekts
    myValve.Open();
    valveStatus := myValve.IsOpen();
  END_PROGRAM
  ```
----
- Beispiele für polymorphes Verhalten
  - Ein Beispiel für polymorphes Verhalten ist die Verwendung der `ItfValve`-Schnittstelle, die sowohl von `BaseValve` als auch von `AdvancedValve` implementiert wird. Die Methodenaufrufe werden zur Laufzeit basierend auf dem tatsächlichen Objekttyp aufgelöst.
  ```st
  PROGRAM Main
    VAR
      myValve : ItfValve;
      valveStatus : BOOL;
    END_VAR
    myValve := BaseValve();
    myValve.Open();
    valveStatus := myValve.IsOpen(); // Zugriff auf BaseValve-Methoden

    myValve := AdvancedValve();
    myValve.Open();
    valveStatus := myValve.IsOpen(); // Zugriff auf AdvancedValve-Methoden
  END_PROGRAM
  ```
---
## Abstraktion und Schnittstellen in ST
- Definition von Schnittstellen
- Implementierung von Schnittstellen-Verträgen
- Beispiele für den Einsatz von Schnittstellen
---
## Besonderheiten von OOP in ST
- Fehlende Konstruktoren
- Keine statischen Variablen
- Keine dynamische Speicherallokation
---
## Zusammenfassung und Ausblick
- Wichtigste Erkenntnisse des Trainings
- Anwendungsbeispiele und Best Practices
- Weiterführende Ressourcen