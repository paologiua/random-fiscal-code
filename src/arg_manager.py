
DEFAULT_CONFIG = [
    {
        "name": "help",
        "--": ["help"],
        "-": ["h"],
        "text": "Print Help (this message) and exit",
        "compatible_with": [],
        "valuable": False,
    },
    {
        "name": "copy",
        "--": ["copy"],
        "-": ["c"],
        "text": "Copy the random fiscal code to the clipboard",
        "compatible_with": ["extended"],
        "valuable": False,
    },
    {
        "name": "extended",
        "--": ["extended"],
        "-": ["e"],
        "text": "Show more information",
        "compatible_with": ["copy"],
        "valuable": False,
    },
    {
        "name": "decode",
        "--": ["decode"],
        "-": ["d"],
        "text": "Decode a fiscal code",
        "compatible_with": [],
        "valuable": True,
    }
]

class ArgManager:
    def __init__(self, config) -> None:
        self.config = config
        self.options = {}
        self.problems = False
        
        import sys 
        
        valuable_arg = None
        for arg in sys.argv[1:]:
            if valuable_arg:
                self.options[valuable_arg] = arg
            elif "--" in arg[0:2] and len(arg[2:]) > 0:
                option = None
                try:
                    option = list(filter(lambda x: arg[2:] in x["--"], self.config))[0]
                except:
                    self.problems = True
                    break

                if option["valuable"]:
                    valuable_arg = option["name"]
                else:
                     self.options[option["name"]] = None

            elif "-" == arg[0] and len(arg[1:]) > 0:
                for char in arg[1:]:
                    option = None
                    try:
                        option = list(filter(lambda x: char in x["-"], self.config))[0]
                    except:
                        self.problems = True
                        break
                    
                    if not option["valuable"]:
                        self.options[option["name"]] = None
                    elif len(arg[1:]) == 1:
                        valuable_arg = option["name"]
                    else:
                        self.problems = True
                        break

                if self.problems:
                    break
            else:
                self.problems = True
                break
        
            option_names = list(self.options.keys())
            for option_name in option_names[0:-1]:
                last_option_compatibility = self.get_arg_by_name(option_names[-1])["compatible_with"]

                if not option_name in last_option_compatibility:
                    self.problems = True
                    break
            
            if self.problems:
                break
    
    def get_arg_by_name(self, name): 
        return list(filter(lambda x: name == x["name"], self.config))[0]
