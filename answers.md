
1. What is the difference between a function and a procedure in PostgreSQL?
функція повертає значеняя чогось і може бути викликана в селекті,
процедура не повертає значення і викликажться через call


2. Can a trigger be executed manually? Why or why not?
не можна,бо він автоматично спрацьовує коли відбувається щось у бд( типу інсерта апдейт деліт)


3. What are the advantages and disadvantages of storing business logic inside the database?
переваги: логіка в одному місці і дані завжди правильні оскільки перевіряються на рівні бази
недоліки: важко тестувати я б сказав і складно преейтти на іншу бд