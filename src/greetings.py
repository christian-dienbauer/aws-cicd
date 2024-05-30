

def get_greeting(name:str):
    '''
    Greet 
    '''
    if name == "":
        raise ValueError("Name is missing!")
    
    return "Welcome " + name