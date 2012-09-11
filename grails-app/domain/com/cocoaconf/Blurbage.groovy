package com.cocoaconf

class Blurbage {
    String code
    String contents

    static constraints = {
        code()
        contents maxSize: 10000
    }
}
