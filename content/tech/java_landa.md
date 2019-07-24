---
draft:true
---
Collections.sort(logs, new Comparator<FaceRecognition>() {
            @Override
            public int compare(FaceRecognition o1, FaceRecognition o2) {
                Float f1 = o1.getScore();
                Float f2 = o2.getScore();
                return f2.compareTo(f1);
            }
        });





Collections.sort(logs, (o1, o2) -> {
            Float f1 = o1.getScore();
            Float f2 = o2.getScore();
            return f2.compareTo(f1);
        });
