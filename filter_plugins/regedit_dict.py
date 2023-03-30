#!/usr/bin/python3


class FilterModule(object):
    def filters(self):
        return {
            "regedit_dict2list": self.regedit_dict2list,
        }

    def regedit_dict2list(self, regedit_dict):
        return [
            config
            | {
                "path": path,
                "name": name,
            }
            for path, names in regedit_dict.items()
            for name, config in names.items()
        ]
