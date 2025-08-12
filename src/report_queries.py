from db_connection import get_connection

def applications_per_job():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("""
        SELECT j.title, COUNT(a.application_id) AS total_applications
        FROM jobs j
        LEFT JOIN applications a ON j.job_id = a.job_id
        GROUP BY j.title
    """)
    results = cur.fetchall()
    for row in results:
        print(f"{row[0]}: {row[1]} applications")
    conn.close()

if __name__ == "__main__":
    applications_per_job()
