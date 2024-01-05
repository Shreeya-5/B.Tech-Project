package EduPaper.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class QuestionPaperGenerator {

    public static void main(String[] args) {
        List<Integer> array1 = List.of(10, 15, 10, 15);
        List<Integer> array2 = List.of(4, 5, 6, 4,3,5,6,5,4,4,4);

        Map<Integer, Integer> freqMap = getFrequencyMap(array2);
        for (Integer num : array1) {
            List<Integer> combination = getCombination(num, freqMap);
            if (combination != null) {
                int sum = combination.stream().mapToInt(Integer::intValue).sum();
                System.out.println(num + " - " + combination + ", Sum: " + sum);
            }
        }
    }

    public static Map<Integer, Integer> getFrequencyMap(List<Integer> arr) {
        Map<Integer, Integer> freqMap = new HashMap<>();
        for (Integer num : arr) {
            freqMap.put(num, freqMap.getOrDefault(num, 0) + 1);
        }
        return freqMap;
    }

    public static List<Integer> getCombination(int target, Map<Integer, Integer> freqMap) {
        List<Integer> result = new ArrayList<>();
        int[] arr = freqMap.keySet().stream().mapToInt(Integer::intValue).toArray();
        Arrays.sort(arr);
        return findCombination(target, arr, result, freqMap);
    }

    public static List<Integer> findCombination(int target, int[] arr, List<Integer> result, Map<Integer, Integer> freqMap) {
        if (target == 0) {
            return result;
        }
        for (int i = arr.length - 1; i >= 0; i--) {
            if (target >= arr[i] && freqMap.get(arr[i]) > 0) {
                result.add(arr[i]);
                freqMap.put(arr[i], freqMap.get(arr[i]) - 1);
                List<Integer> temp = findCombination(target - arr[i], arr, result, freqMap);
                if (temp != null) {
                    return temp;
                }
                result.remove(result.size() - 1);
                freqMap.put(arr[i], freqMap.get(arr[i]) + 1);
            }
        }
        return null;
    }
}
