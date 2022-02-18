#include "OrdinFactory.h"
#include<iostream>

IOrdin* OrdinFactory::generare_ordincorect(std::string buffer)
{
    IOrdin* io = nullptr;
    switch ((buffer.c_str())[0])
    {
    case '1':
        io = new OrdinLog;
        break;
    case '2':
        io = new OrdinInterogareOrarGrupa;
        break;
    case '3':
        io = new OrdinInterogareOrarProfesor;
        break;
    case '4':
        io = new OrdinInterogareFisaPO;
        break;
    case '5':
        io = new OrdinInterogareFisaActivitate;
        break;
    case '6':
        io = new OrdinModificareStergere;
        break;
    case '7':
        io = new OrdinModificare;
        break;
    case '8':
        io = new OrdinModificareAdaugareProiect;
        break;
    case '9':
        io = new OrdinInterogareProfesori;
        break;
    default:
        std::cout << "Not good";
        std::cout << "Incepe cu " << (buffer.c_str())[0] << std::endl;
        //exit(0);
        buffer = "Nu exista asemenea ordin\n";
        io = new OrdinLog;
    }

    io->PopuleazaOrdin(buffer);

    return io;
}
