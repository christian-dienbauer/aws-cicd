

def get_greeting(name:str):
    '''
    Greet 
    '''
    if name is "":
        raise ValueError("Name is missing!")
    
    return "Welcome " + name