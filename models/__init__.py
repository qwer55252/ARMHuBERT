from .armhubert import model as armhubert
from .maskhubert import model as maskhubert
from .hwdhubert import model as hwdhubert


def init_model(model_name):
    model_config_dict = {
                        'armhubert': armhubert.CustomStudentModelConfig,
                        'maskhubert': maskhubert.CustomStudentModelConfig,
                        'armwavlm': armhubert.CustomStudentModelConfig,  # ARMwavLM shares the same student model with ARMHuBERT
                        'hwdhubert': hwdhubert.CustomStudentModelConfig,
    }

    model_dict = {
                'armhubert': armhubert.CustomStudentModel,
                'maskhubert': maskhubert.CustomStudentModel,
                'armwavlm': armhubert.CustomStudentModel,  # ARMwavLM shares the same student model with ARMHuBERT
                'hwdhubert': hwdhubert.CustomStudentModel,
    }
    
    if model_name in model_config_dict:
        return model_config_dict[model_name], model_dict[model_name]
    else:
        raise NotImplementedError
