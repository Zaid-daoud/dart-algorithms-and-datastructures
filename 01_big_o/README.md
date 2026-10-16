# ⚡ Big O Notation in Dart & Flutter

A clean, detailed, and comprehensive reference guide for mastering **Time & Space Complexity** in Dart and Flutter.

---

## 🏆 Speed & Performance Ranking

```text
⚡ [FASTEST / BEST]                                                                  [SLOWEST / WORST] 🐢
 O(1)   <   O(log n)   <   O(n)   <   O(n log n)   <   O(n²)   <   O(2ⁿ)   <   O(n!)
```

### ⏱️ Performance Benchmarks ($N = 1,000,000$ Items)

| Notation | Rating | Operations Needed | Approx. Time | Typical Algorithm / Operation |
| :--- | :--- | :--- | :--- | :--- |
| **$O(1)$** | 🟢 **Best** | 1 | ~0.000001s | Map lookup, List index access, `.length` |
| **$O(\log n)$** | 🟢 **Excellent** | ~20 | ~0.00002s | Binary Search on sorted data |
| **$O(n)$** | 🟡 **Good** | 1,000,000 | ~0.001s | Linear search, `.where()`, `.fold()`, `.map()` |
| **$O(n \log n)$** | 🟠 **Fair** | ~20,000,000 | ~0.02s | Sorting algorithms (`List.sort()`) |
| **$O(n^2)$** | 🔴 **Slow** | 1,000,000,000,000 | ~16.6 min | Nested loops, naive duplicate check |
| **$O(2^n)$** | 💥 **Horrible** | $2^{1,000,000}$ | Billions of years | Naive recursive Fibonacci |
| **$O(n!)$** | 💥 **Worst** | $1,000,000!$ | Billions of years | Generating all permutations |

---

## 📂 Code Files Index

1. [`01_o1_constant.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/01_big_o/01_o1_constant.dart) — Constant Time $O(1)$ & Amortized $O(1)$
2. [`02_ologn_logarithmic.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/01_big_o/02_ologn_logarithmic.dart) — Logarithmic Time $O(\log n)$
3. [`03_on_linear.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/01_big_o/03_on_linear.dart) — Linear Time $O(n)$ & Best vs Worst Case
4. [`04_onlogn_linearithmic.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/01_big_o/04_onlogn_linearithmic.dart) — Linearithmic Time $O(n \log n)$
5. [`05_on2_quadratic.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/01_big_o/05_on2_quadratic.dart) — Quadratic Time $O(n^2)$ & $O(n)$ Set Optimization
6. [`06_o2n_exponential.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/01_big_o/06_o2n_exponential.dart) — Exponential Time $O(2^n)$ & Memoization Optimization
7. [`07_onfactorial_factorial.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/01_big_o/07_onfactorial_factorial.dart) — Factorial Time $O(n!)$
8. [`08_space_complexity.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/01_big_o/08_space_complexity.dart) — Space Complexity (Heap, Call Stack, Grid)
9. [`main_big_o.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/01_big_o/main_big_o.dart) — Executable Suite for All Modules

---

## 📖 Detailed English Reference

### 1. $O(1)$ — Constant Time
- **Explanation:** The execution time is fixed and does not change when input size $N$ grows.
- **Dart Operations:** Direct array indexing (`list[index]`), Map hash lookup (`map[key]`), checking `.length` or `.isEmpty`.
- **Amortized $O(1)$:** Inserting elements via `list.add()`. Inserting is $O(1)$ on average, but occasionally triggers an $O(n)$ internal array resize when capacity is reached.

### 2. $O(\log n)$ — Logarithmic Time
- **Explanation:** The problem size is cut in half at every step.
- **Dart Operations:** Binary Search on a sorted `List`. Searching 1,000,000 items requires at most 20 steps.

### 3. $O(n)$ — Linear Time
- **Explanation:** Execution time increases directly in proportion to the input size $N$.
- **Dart Operations:** Single `for` loop, filtering lists with `.where()`, aggregating values with `.fold()`, transforming elements with `.map()`.
- **Best vs Worst Case:** Searching an element at the first index takes $O(1)$ (Best Case $\Omega$), while searching an element at the end or missing takes $O(n)$ (Worst Case $O$).

### 4. $O(n \log n)$ — Linearithmic Time
- **Explanation:** Performs a logarithmic $O(\log n)$ operation for each of the $N$ items.
- **Dart Operations:** Efficient comparison sorting using `list.sort()` (Dart uses Dual-Pivot Quicksort / TimSort).

### 5. $O(n^2)$ — Quadratic Time
- **Explanation:** Execution time scales quadratically with $N$.
- **Dart Operations:** Nested loops processing the same dataset (e.g. comparing all pairs).
- **Optimization:** Refactor $O(n^2)$ nested loops to $O(n)$ linear time using a `Set` or `Map` for fast $O(1)$ lookups.

### 6. $O(2^n)$ — Exponential Time
- **Explanation:** Execution time doubles with every single item added to $N$.
- **Dart Operations:** Naive recursive algorithms without memoization (e.g., naive recursive Fibonacci).
- **Optimization:** Convert $O(2^n)$ recursion to $O(n)$ using **Memoization** (Dynamic Programming).

### 7. $O(n!)$ — Factorial Time
- **Explanation:** Execution time multiplies by $N$ for every new element added.
- **Dart Operations:** Generating all possible permutations of a dataset.

### 8. Space Complexity (Memory Analysis)
- **$O(1)$ Auxiliary Space:** Modifying variables in-place without allocating extra memory.
- **$O(n)$ Heap Space:** Creating new lists or maps proportional to input size $N$.
- **$O(n)$ Call Stack Space:** Call frames accumulated during recursive function calls.
- **$O(n^2)$ Space:** Allocating 2D matrices or grids of size $N \times N$.

---

## 🇸🇦 الشرح التفصيلي باللغة العربية

### 📌 مقدمة في التعقيد الزمني والمكاني (Big O Notation)
تُستخدم دالة **Big O** لقياس كفاءة الخوارزميات عند كِبَر حجم البيانات ($N$). وهي تقيس أداء الكود في **الحالة الأسوأ (Worst Case)** لضمان عمل التطبيق بسلاسة بدون بطء أو استهلاك زائد للذاكرة.

---

### 1️⃣ $O(1)$ — التعقيد الثابت (Constant Time)
* **الشرح:** يستغرق الكود نفس الوقت تماماً للعمل بغض النظر عن حجم البيانات (سواء كانت 5 عناصر أو 5,000,000 عنصر).
* **أمثلة في Dart:**
  - الوصول المباشر بالـ Index: `products[500000]`
  - البحث المباشر بـ Key في الـ Map: `userCache['user_id']`
  - قراءة الخصائص المباشرة: `list.length` أو `list.isEmpty`
* **المفهوم المتقدم (Amortized $O(1)$):** إضافة عنصر إلى القائمة `list.add()`. الإضافة تتم في زمن ثابت $O(1)$ عادةً، وعندما تمتلئ الذاكرة المخصصة للقائمة، يقوم Dart بإعادة تجميع المصفوفة ومضاعفة حجمها $O(n)$. يسمى متوسط هذا الوقت بـ **Amortized $O(1)$**.

---

### 2️⃣ $O(\log n)$ — التعقيد اللوغاريتمي (Logarithmic Time)
* **الشرح:** يتم تنصيف حجم البيانات إلى النصف في كل خطوة من خطوات الخوارزمية.
* **أمثلة في Dart:**
  - خوارزمية **البحث الثنائي (Binary Search)** على القوائم المرتبة.
  - للبحث في قائمة بـ 1,000,000 عنصر، تحتاج الخوارزمية إلى **20 خطوة فقط كأقصى حد**!

---

### 3️⃣ $O(n)$ — التعقيد الخطي (Linear Time)
* **الشرح:** يتناسب وقت التنفيذ طردياً بنسبة $1:1$ مع حجم البيانات $N$. مضاعفة البيانات تؤدي لمضاعفة وقت التنفيذ.
* **أمثلة في Dart:**
  - الدوران الأحادي بـ `for` loop.
  - فلترة القوائم بـ `.where()`.
  - تجميع العناصر بـ `.fold()`.
* **الحالة الأفضل والأسوأ (Best vs Worst Case):**
  - **Best Case ($\Omega$):** إيجاد العنصر في أول القائمة يستغرق $O(1)$.
  - **Worst Case ($O$):** إيجاد العنصر في آخر القائمة أو عدم وجوده يستغرق $O(n)$.

---

### 4️⃣ $O(n \log n)$ — التعقيد الخطي اللوغاريتمي (Linearithmic Time)
* **الشرح:** ينفذ عملية لوغاريتمية $O(\log n)$ لكل عنصر من عناصر القائمة $N$.
* **أمثلة في Dart:**
  - خوارزميات الترتيب الفعالة مثل `list.sort()`. يستخدم Dart خوارزميات ترتيب متقدمة مثل Dual-Pivot Quicksort / TimSort.

---

### 5️⃣ $O(n^2)$ — التعقيد التربيعي (Quadratic Time)
* **الشرح:** يتضاعف الوقت بشكل تربيعي مع زيادة البيانات ($N \times N$).
* **أمثلة في Dart:**
  - اللوبات المتداخلة (Nested Loops) التي تمر على نفس المجموعة.
* **طريقة التحسين:** يمكن تحسين الكود من $O(n^2)$ إلى $O(n)$ بأسلوب ذكي عبر استخدام `Set` أو `Map` للبحث السريع.

---

### 6️⃣ $O(2^n)$ — التعقيد الأسي (Exponential Time)
* **الشرح:** يتضاعف الوقت بالكامل عند إضافة عنصر واحد فقط إلى $N$.
* **أمثلة في Dart:**
  - الدوال التكرارية المباشرة (Recursion) دون حفظ النتائج مثل (Naive Recursive Fibonacci).
* **طريقة التحسين:** تحويل الكود إلى $O(n)$ باستخدام البرمجة الديناميكية **(Memoization)**.

---

### 7️⃣ $O(n!)$ — التعقيد العاملي (Factorial Time)
* **الشرح:** أبطأ أنواع التعقيد على الإطلاق. يضرب وقت التنفيذ في $N$ مع كل عنصر جديد.
* **أمثلة في Dart:**
  - توليد جميع التباديل والاحتمالات القائمة لقائمة من العناصر (Permutations).

---

### 8️⃣ تعقيد الذاكرة (Space Complexity)
* **$O(1)$ Auxiliary Space:** تعديل البيانات في مكانها (In-place) دون استهلاك ذاكرة إضافية.
* **$O(n)$ Heap Space:** تخصيص قوائم أو مصفوفات جديدة في الذاكرة تتناسب مع $N$.
* **$O(n)$ Call Stack Space:** الذاكرة المحجوزة في مكدس استدعاء الدوال عند استخدام Recursion.
* **$O(n^2)$ Space:** تخصيص مصفوفات ثنائية الأبعاد (2D Grid / Matrix) بحجم $N \times N$.

---

## 🏃 How to Run | طريقة التشغيل

لتشغيل كافة الأمثلة المجمعة:
```bash
dart run main_big_o.dart
```

أو تشغيل أي ملف فردي:
```bash
dart run 01_o1_constant.dart
dart run 02_ologn_logarithmic.dart
dart run 03_on_linear.dart
dart run 04_onlogn_linearithmic.dart
dart run 05_on2_quadratic.dart
dart run 06_o2n_exponential.dart
dart run 07_onfactorial_factorial.dart
dart run 08_space_complexity.dart
```
