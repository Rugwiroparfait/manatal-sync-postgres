import csv
from db_connection import get_connection

def sync_candidates(csv_file):
    conn = get_connection()
    cur = conn.cursor()

    with open(csv_file, newline='', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        for row in reader:
            cur.execute("""
                INSERT INTO candidates (first_name, last_name, email, phone, skills)
                VALUES (%s, %s, %s, %s, %s)
                ON CONFLICT (email) DO NOTHING
            """, (row['first_name'], row['last_name'], row['email'], row['phone'], row['skills']))

    conn.commit()
    cur.close()
    conn.close()

if __name__ == "__main__":
    sync_candidates("../data/mock_candidates.csv")
