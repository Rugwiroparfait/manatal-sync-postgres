def clean_phone(phone):
    return ''.join(filter(str.isdigit, phone))

def normalize_email(email):
    return email.strip().lower()
