//package com.my.flutter_app123456;
//
//import android.app.Activity;
//import android.os.Handler;
//import android.os.Message;
//import android.util.Log;
//
//import java.io.IOException;
//
//import io.flutter.plugin.common.EventChannel;
//import io.flutter.plugin.common.PluginRegistry;
//
//import com.rabbitmq.client.AMQP;
//import com.rabbitmq.client.Channel;
//import com.rabbitmq.client.Connection;
//import com.rabbitmq.client.ConnectionFactory;
//import com.rabbitmq.client.Consumer;
//import com.rabbitmq.client.DefaultConsumer;
//import com.rabbitmq.client.Envelope;
//
///**
// * 作者：A8205 on 2019-3-6 10:36
// * <p>
// * 邮箱：jhsyzhaojie@126.com
// */
//public class FlutterPluginRabbitMQ implements EventChannel.StreamHandler {
//
//    public static String CHANNEL = "com.my.flutter/rabbit";
//
//    static EventChannel channel;
//
//    private Activity activity;
//
//    ConnectionFactory factory = new ConnectionFactory();
//    Thread subscribeThread;
//
//    private FlutterPluginRabbitMQ(Activity activity) {
//        this.activity = activity;
//    }
//
//
//    public static void registerWith(PluginRegistry.Registrar registrar) {
//        channel = new EventChannel(registrar.messenger(), CHANNEL);
//        FlutterPluginRabbitMQ instance = new FlutterPluginRabbitMQ(registrar.activity());
//        //setMethodCallHandler在此通道上接收方法调用的回调
//        channel.setStreamHandler(instance);
//
//
//    }
//
//
//    @Override
//    public void onListen(Object o, EventChannel.EventSink eventSink) {
//        setupConnectionFactory();
//        subscribeThread =new Thread(()->{
//
//            try {
//                // 创建新的连接
//                Connection connection = factory.newConnection("10.1.9.168", 5672);
//                // 创建通道
//                Channel channel = connection.createChannel();
//                // 处理完一个消息，再接收下一个消息
//
//                // 随机命名一个队列名称
//                //String queueName = System.currentTimeMillis() + "queueNameCar";
//                // 声明交换机类型
//                channel.exchangeDeclare(1,"cap.default.router", "topic");
//                // 声明队列（持久的、非独占的、连接断开后队列会自动删除）
//                //AMQP.Queue.DeclareOk q = channel.queueDeclare(queueName, true, false, true, null);
//                AMQP.Queue.DeclareOk q = channel.queueDeclare(1,"my.plugin.flutter");
//                // 声明共享队列
//                // 根据路由键将队列绑定到交换机上（需要知道交换机名称和路由键名称）
//                channel.queueBind(1,q.getQueue(), "cap.default.router", "易流GPS异常报警");
//                // 创建消费者获取rabbitMQ上的消息。每当获取到一条消息后，就会回调handleDelivery（）方法，该方法可以获取到消息数据并进行相应处理
//                Consumer consumer = new DefaultConsumer(channel) {
//                    @Override
//                    public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body)
//                            throws IOException {
//                        super.handleDelivery(consumerTag, envelope, properties, body);
//                        // 通过geiBody方法获取消息中的数据
//                        String message = new String(body);
//                        Log.i("geibody", envelope.getRoutingKey() + "':'" + message + "'");
//
//                        eventSink.success(message);
//                    }
//                };
//                channel.basicConsume(1, q.getQueue(), true, consumer);
//            } catch (Exception e) {
//                e.printStackTrace();
//                try {
//                    Thread.sleep(5000);
//                } catch (InterruptedException e1) {
//                    e1.printStackTrace();
//                }
//            }
//
//
//        });
//        subscribeThread.start();
//
//    }
//
//    @Override
//    public void onCancel(Object o) {
//        subscribeThread.interrupt();
//    }
//
//    /**
//     * rabbitmq start
//     */
//
//    /**
//     * 连接设置
//     */
//
//    private void setupConnectionFactory() {
//
//        factory.getParameters().setUsername("raadmin");
//        factory.getParameters().setPassword("123qwe");
//        factory.getParameters().setVirtualHost("/tms");
//    }
//
//    /**
//     * end
//     */
//}
