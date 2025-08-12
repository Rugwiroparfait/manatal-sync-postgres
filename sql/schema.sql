CREATE TABLE recruiters (
    recruiter_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE jobs (
    job_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    location VARCHAR(100),
    recruiter_id INT REFERENCES recruiters(recruiter_id)
);

CREATE TABLE candidates (
    candidate_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    skills TEXT
);

CREATE TABLE applications (
    application_id SERIAL PRIMARY KEY,
    candidate_id INT REFERENCES candidates(candidate_id),
    job_id INT REFERENCES jobs(job_id),
    status VARCHAR(50),
    applied_on DATE
);
