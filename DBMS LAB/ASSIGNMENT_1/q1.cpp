#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main()
{
    int data[4][6];
    int total[4] = {0};
    int price[8][2];

    for (int i = 1; i <= 8; i++)
    {
        cout << "Enter the price of the product " << i << ": ";
        cin >> price[i - 1][1];
        price[i - 1][0] = i;
    }
    cout << endl;

    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j < 6; j++)
            data[i][j] = 0;
    }
    ifstream fin("input.txt");

    string line;
    do
    {
        int region;
        int salesman;
        int product_id;
        int quantity;

        fin >> region;
        fin >> salesman;
        fin >> product_id;
        fin >> quantity;

        data[region - 1][salesman - 1] += quantity * price[product_id - 1][1];
        total[region - 1] += quantity * price[product_id - 1][1];
    } while (getline(fin, line));

    fstream new_file;
    new_file.open("output.txt", ios::out);
    if (!new_file)
        cout << "File creation failed" << endl;
    else
    {
        new_file << "ABC Company" << endl
                 << endl
                 << endl;
        for (int i = 1; i <= 4; i++)
        {
            new_file << "Region " << i << endl;
            for (int j = 1; j <= 6; j++)
            {
                new_file << "Salesman " << j << "              Rs. " << data[i - 1][j - 1] << "/-" << endl;
            }
            new_file << "Total sale at Region " << i << "  Rs. " << total[i - 1] << "/-" << endl
                     << endl
                     << endl;
        }
    }
    return 0;
}