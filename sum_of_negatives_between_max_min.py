def sum_of_negatives_between_max_min(array):
    if not array:
        return 0 # Если массив пустой, возвращаем 0

    max_index = find_index_of_maximum(array)  # Индекс максимального элемента
    min_index = find_index_of_minimum(array)  # Индекс минимального элемента

    # Находим более низкий и более высокий индексы для корректного среза
    start_index = min(max_index, min_index) + 1
    end_index = max(max_index, min_index)

    # Суммируем отрицательные элементы в диапазоне между максимальным и минимальным
    negative_sum = sum(x for x in array[start_index:end_index] if x < 0)

    return negative_sum

def find_index_of_maximum(array):
    if not array:
        return None  # Если массив пустой, возвращаем None

    max_index = 0  # Начинаем с первого индекса
    for i in range(1, len(array)):
        if array[i] > array[max_index]:
            max_index = i  # Обновляем индекс максимального элемента
    return max_index

def find_index_of_minimum(array):
    if not array:
        return None  # Если массив пустой, возвращаем None

    min_index = 0  # Начинаем с первого индекса
    for i in range(1, len(array)):
        if array[i] < array[min_index]:
            min_index = i  # Обновляем индекс минимального элемента
    return min_index

if __name__ == "__main__":
    # Пример использования
    A = [3, -1, 2, 5, -4, -6, 1, -3]
    result = sum_of_negatives_between_max_min(A)
    print("Сумма отрицательных элементов между максимальным и минимальным:", result)  # -4
