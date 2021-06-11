class Task < ApplicationRecord

  enum state: {
    "Pendiente": 0,
    "Terminado": 1
  }
end
