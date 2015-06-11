-- FIRST WE HAVE TO CREATE THE CONTEXT A PACKAGECREATE OR REPLACE CONTEXT CTX USING CONTEXT_PKG;/

CREATE OR REPLACE PACKAGE CONTEXT_PKG AS  PROCEDURE NAME_VALUE(N VARCHAR2, V VARCHAR2);
END;
/

CREATE OR REPLACE PACKAGE BODY CONTEXT_PKG AS  PROCEDURE NAME_VALUE(N VARCHAR2, V VARCHAR2) AS
  BEGIN
    DBMS_SESSION.SET_CONTEXT('CTX', N, V);
  END;
END;
/

-- SETTING VARIABLE
EXECUTE CONTEXT_PKG.NAME_VALUE(N => 'USERLOGON',V => 'ADMIN');


-- GETTING VARIABLE
SELECT CAST(SYS_CONTEXT('CTX', 'USERLOGON') AS VARCHAR2(30)) AS USERLOGON FROM DUAL;
