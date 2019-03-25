//package com.my.flutter_app123456;
//
//import android.app.Activity;
//import android.os.Handler;
//import android.os.Message;
//import android.util.Log;
//
//
//import com.rabbitmq.client.AMQP;
//import com.rabbitmq.client.Channel;
//import com.rabbitmq.client.Connection;
//import com.rabbitmq.client.ConnectionFactory;
//import com.rabbitmq.client.Consumer;
//import com.rabbitmq.client.DefaultConsumer;
//import com.rabbitmq.client.Envelope;
//
//import java.io.IOException;
//import java.util.concurrent.TimeUnit;
//
//import io.flutter.plugin.common.EventChannel;
//import io.flutter.plugin.common.PluginRegistry;
//
//import io.reactivex.Observable;
//import io.reactivex.Observer;
//import io.reactivex.disposables.Disposable;
//
//
///**
// * 作者：A8205 on 2019-3-1 17:23
// * <p>
// * 邮箱：jhsyzhaojie@126.com
// */
//public class FlutterPluginReceive implements EventChannel.StreamHandler {
//
//
//    public static String CHANNEL = "com.my.flutter/plugin";
//
//    static EventChannel channel;
//
//    private Activity activity;
//
////    ConnectionFactory factory = new ConnectionFactory();
////    Thread subscribeThread;
////    String message = "";
//
//    private FlutterPluginReceive(Activity activity) {
//        this.activity = activity;
//
////        setupConnectionFactory();
////
////        //从线程中获取数据，更新ui
////        final Handler incomingMessageHandler = new Handler() {
////            @Override
////            public void handleMessage(Message msg) {
////                message = msg.getData().getString("msg");
////                Log.i("test", "msg" + message);
////            }
////
////        };
////        subscribe(incomingMessageHandler);
//
//    }
//
//
//
//
//    public static void registerWith(PluginRegistry.Registrar registrar) {
//        channel = new EventChannel(registrar.messenger(), CHANNEL);
//        FlutterPluginReceive instance = new FlutterPluginReceive(registrar.activity());
//        //setMethodCallHandler在此通道上接收方法调用的回调
//        channel.setStreamHandler(instance);
//
//
//    }
//
//
//    @Override
//    public void onListen(Object o, EventChannel.EventSink eventSink) {
//        Observable.interval(1000, TimeUnit.MILLISECONDS).subscribe(new Observer<Long>() {
//            @Override
//            public void onSubscribe(Disposable d) {
//
//            }
//
//            @Override
//            public void onNext(Long aLong) {
//
//                eventSink.success(aLong.intValue());
//            }
//
//            @Override
//            public void onError(Throwable e) {
//                eventSink.error("计时器异常", "异常", e.getMessage());
//            }
//
//            @Override
//            public void onComplete() {
//            }
//
//        });
//
//    }
//
//    @Override
//    public void onCancel(Object o) {
//
//        Log.i("FlutterPluginCounter", "FlutterPluginCounter:onCancel");
//
//    }
//
//    /**
//     * rabbitmq start
//     */
//
//    /**
//     * 连接设置
//     */
////    private void setupConnectionFactory() {
////        factory.setHost("10.1.9.168");//主机地址：
////        factory.setPort(5672);// 端口号
////        factory.setUsername("raadmin");// 用户名
////        factory.setPassword("123qwe");// 密码
////        factory.setAutomaticRecoveryEnabled(true);// 设置连接恢复
////    }
//
//    /**
//     * 创建消费者线程
//     *
//     * @param //handler
//     */
////    void subscribe(final Handler handler) {
////
////        subscribeThread = new Thread(() -> {
////            try {
////                // 创建新的连接
////                Connection connection = factory.newConnection();
////                // 创建通道
////                Channel channel = connection.createChannel();
////                // 处理完一个消息，再接收下一个消息
////                channel.basicQos(1);
////                // 随机命名一个队列名称
////                String queueName = System.currentTimeMillis() + "queueNameCar";
////                // 声明交换机类型
////                channel.exchangeDeclare("", "direct", true);
////                // 声明队列（持久的、非独占的、连接断开后队列会自动删除）
////                AMQP.Queue.DeclareOk q = channel.queueDeclare(queueName, true, false, true, null);
////                // 声明共享队列
////                // 根据路由键将队列绑定到交换机上（需要知道交换机名称和路由键名称）
////                channel.queueBind(q.getQueue(), "", "");
////                // 创建消费者获取rabbitMQ上的消息。每当获取到一条消息后，就会回调handleDelivery（）方法，该方法可以获取到消息数据并进行相应处理
////                Consumer consumer = new DefaultConsumer(channel) {
////                    @Override
////                    public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body)
////                            throws IOException {
////                        super.handleDelivery(consumerTag, envelope, properties, body);
////                        // 通过geiBody方法获取消息中的数据
////                        String message = new String(body);
////                        // 发消息通知UI更新
////                        Message msg = handler.obtainMessage();
////                        handler.sendMessage(msg);
////                    }
////                };
////                channel.basicConsume(q.getQueue(), true, consumer);
////            } catch (Exception e) {
////                e.printStackTrace();
////                try {
////                    Thread.sleep(5000);
////                } catch (InterruptedException e1) {
////                    e1.printStackTrace();
////                }
////            }
////        });
////        subscribeThread.start();// 开启线程获取RabbitMQ推送消息 }
////    }
//    /**
//         * end
//         */
//}
