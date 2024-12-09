# Базовый класс
class Animal:
    def speak(self):
        return "Some sound"

# Производный класс
class Dog(Animal):
    def speak(self):
        return "Woof!"

# Тестовая программа
def main():
    # Создаем экземпляры классов
    animal = Animal()
    dog = Dog()

    # Демонстрируем работу методов
    print("Animal speaks:", animal.speak())  # Вывод: Some sound
    print("Dog speaks:", dog.speak())        # Вывод: Woof!

if __name__ == "__main__":
    main()
