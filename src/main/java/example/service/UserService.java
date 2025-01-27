package example.service;

import org.springframework.transaction.annotation.Transactional;

public interface UserService {
    void doSomething();

    @Transactional(rollbackFor = {Throwable.class})
    void doSomething(String orderFiled);

    @Transactional(rollbackFor = {Throwable.class})
    void doSomething2(int id);
}
