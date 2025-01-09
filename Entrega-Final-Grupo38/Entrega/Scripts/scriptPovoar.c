#include <mysql/mysql.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// COMPILING: gcc -o povoamento povoamento.c -I/opt/homebrew/opt/mysql-client/include -L/opt/homebrew/opt/mysql-client/lib -lmysqlclient
// Path varia com o sistema

// ubuntu -> gcc -o povoamento povoamento.c -I/usr/include/mysql -L/usr/lib/x86_64-linux-gnu -lmysqlclient


void finish_with_error(MYSQL *con) {
    fprintf(stderr, "%s\n", mysql_error(con));
    mysql_close(con);
    exit(1);
}

char* getfield(char* line, int N) {
    int i = 0;
    char* field; 
    char* line_cpy = strdup(line); // Duplicar a linha para não modificar a original
    char* tofree = line_cpy; // Guardar o ponteiro para liberar depois
    while ((field = strsep(&line_cpy, ";")) != NULL) {
        if (i == N) {
            char* result = strdup(field); // Copiar o campo encontrado
            free(tofree); // Liberar a linha duplicada
            return result; // Retornar a cópia do campo
        }
        i++;
    }
    free(tofree); // Liberar a linha duplicada se não encontrado
    return NULL;
}

int main(int argc, char** argv) {
    MYSQL* con = mysql_init(NULL);

    if (con == NULL) {
        fprintf(stderr, "mysql_init() failed\n");
        exit(1);
    }

    if (mysql_real_connect(con, "localhost", "root", "pass", 
          "Fenix", 0, NULL, 0) == NULL) {
        finish_with_error(con);
    }    

    FILE* file_fd = fopen("povoamento.csv", "r");
    if (file_fd == NULL) {
        perror("Erro ao abrir o arquivo");
        exit(1);
    }

    char line[1024];
    
    while (fgets(line, 1024, file_fd)) {
        char* line_cpy = strdup(line);

        char* recordType = getfield(line_cpy, 0);
        if (strcmp(recordType, "D") == 0) { // povoar detetives
            free(line_cpy); // Liberar line_cpy usado pelo getfield
            line_cpy = strdup(line); // Duplicar novamente para evitar modificações

            char* Nome = getfield(line_cpy, 1);
            char* Salario = getfield(line_cpy, 2);
            char* Especializacao = getfield(line_cpy, 3);
            char* nCasosResolvidos = getfield(line_cpy, 4);
            char* nCasosAtribuidos = getfield(line_cpy, 5);
            char* Agencia_ID = getfield(line_cpy, 6);
            char* Patente_ID = getfield(line_cpy, 7);

            char query[1024];
            snprintf(query, sizeof(query), 
                "INSERT INTO Detetive (Nome, Salario, Especializacao, nCasosResolvidos, nCasosAtribuidos, Agencia_ID, Patente_ID) VALUES ('%s', %s, '%s', %s, %s, %s, %s)",
                Nome, Salario, Especializacao, nCasosResolvidos, nCasosAtribuidos, Agencia_ID, Patente_ID);

            if (mysql_query(con, query)) {
                finish_with_error(con);
            }

            free(Nome);
            free(Salario);
            free(Especializacao);
            free(nCasosResolvidos);
            free(nCasosAtribuidos);
            free(Agencia_ID);
            free(Patente_ID);
        }else if (strcmp(recordType, "C") == 0) { // povoar clientes
            char* Nome = getfield(line_cpy, 1);
            char* Contribuinte = getfield(line_cpy, 2);
            char* Data_nascimento = getfield(line_cpy, 3);
            char* Telefone = getfield(line_cpy, 4);
            char* Genero = getfield(line_cpy, 5);
            char* Email = getfield(line_cpy, 6);
            char* Agencia_ID = getfield(line_cpy, 7);

            char query[1024];
            snprintf(query, sizeof(query), 
                "INSERT INTO Cliente (Nome, Contribuinte, Data_nascimento,Telefone ,Genero, Email, Agencia_ID) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s' )",
                Nome, Contribuinte, Data_nascimento,Telefone, Genero, Email, Agencia_ID);

            if (mysql_query(con, query)) {
                finish_with_error(con);
            }

            free(Nome);
            free(Contribuinte);
            free(Data_nascimento);
            free(Telefone);
            free(Genero);
            free(Email);
            free(Agencia_ID);
        }
        free(recordType); // Liberar recordType
        free(line_cpy);
    }

    fclose(file_fd);
    mysql_close(con);
    return 0;
}
