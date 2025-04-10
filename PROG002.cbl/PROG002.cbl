        IDENTIFICATION DIVISION.
       PROGRAM-ID                 PROG0010.
       AUTHOR.                    RENZO-ALVAREZ.
       INSTALLATION.              CAPACITACION RENZO.
       DATE-WRIITEN.              17/11/2025.
       DATE-COMPILED.
       SECURITY.                  NO CONFIDENCIAL.
      *----------------------------------------------------------------*
      *OBJETIVO: LEER E IMPRIMIR EL ARCHIVOS DE LOS EMPLEADOS DE LA    *
      *          EMPRESA                                               *
      *----------------------------------------------------------------*

       ENVIROMMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.           IBM-3083.
       OBJECT-COMPUTER.           IBM-3083.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLEADOS ASSIGN TO UT-S-EMPLEADO.
           SELECT REPORTE   ASSIGN TO UT-S-REPORTE.

       DATA DIVISION.
       FILE SECTION .
       FD  EMPLEADOS
           LABEL RECORD ARE STANDARD
           RECORD CONTAINS 50 CHARACTERS
           BLOCK CONTAINS 0 RECORDS
           DATA RECORD IS REG-EMPLEADOS.
       01  REG-EMPLEADOS          PIC X(50).

       FD  REPORTE
           LABEL RECORD ARE STANDARD
           RECORD CONTAINS 50 CHARACTERS
           BLOCK CONTAINS 0 RECORDS
           DATA RECORD IS REG-REPORTE.
       01  REG-REPORTE            PIC X(50).

       WORKING-STORAGE SECTION.
       01  WS-AREAS-A-USAR.
           05 WS-REG-EMPLEADOS.
              10 WS-NUMERO-EMP    PIC 9(05).
              10 WS-NOMBRE-EMP    PIC X(30).
              10 WS-STATUS-EMP    PIC 9(01).
              10 WS-DEPTO-EMP     PIC 9(03).
              10 WS-PUESTO-EMP    PIC 9(02).
              10 WS-SALARIO-EMP   PIC 9(07)V99.
           05 WS-LEIDOS-EMP       PIC 9(05)    VALUE ZEROS.
           05 WS-IMPRESOS         PIC 9(05)    VALUE ZEROS.
           05 WS-TOTAL-SALARIOS   PIC 9(09)V99 VALUE ZEROS.

       01  WS-TITULO-1
           05  FILLER             PIC X(28)    VALUE SPACES.
           05  WS-TIT-1           PIC X(23)
                                  VALUE "EMPLEADOS DE LA EMPRESA".
           05  FILLER             PIC X(29)    VALUE SPACES.

       01  WS-DETALLE.
           05 FILLER              PIC X(01)    VALUE SPACES.
           05 WS-DET-TODO         PIC X(50).
           05 FILLER              PIC X(15)    VALUE SPACES.

       01  WS-DETALLE-LEIDOS.
           05  FILLER             PIC X(01).
           05  FILLER             PIC X(29)
                                  VALUE "TOTAL DE EMPLEADOS LEIDOS : ".
           05  WS-TOT-LEIDOS      PIC X(29)    VALUE SPACES.








       LINKAGE SECTION
       01  LK-FECHA.
           05 FILLER              PIC X(2).
           05 LK-DIA              PIC 9(2).
           05 LK-MES              PIC 9(2).
           05 LK-ANIO             PIC 9(4).

       PROCEDURE DIVISION USEING LK-FECHA.

      