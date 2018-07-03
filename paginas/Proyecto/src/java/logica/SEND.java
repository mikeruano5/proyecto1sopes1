package logica;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author scxal
 */
import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;
import com.rabbitmq.client.QueueingConsumer;
import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;


public class SEND {
    private final static String HOST = "35.196.177.164";
    Channel channel;
    Connection connection;
    String name = "";
    QueueingConsumer consumer;
    
    public SEND(){
        try{
            ConnectionFactory factory = new ConnectionFactory();
            factory.setHost(HOST);
            factory.setUsername("admin");
            factory.setPassword("admin");
            connection = factory.newConnection();
            channel = connection.createChannel();
            name = channel.queueDeclare().getQueue();
            consumer = new QueueingConsumer(channel);
            channel.basicConsume(name, true, consumer);
            System.out.println(name);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public String send(String MSG,String queue){
        System.out.println("send "+MSG);
        try{
            final String corrId = UUID.randomUUID().toString();
            AMQP.BasicProperties props = new AMQP.BasicProperties
                .Builder()
                .correlationId(corrId)
                .replyTo(name)
                .build();

            channel.basicPublish("", queue, props, MSG.getBytes("UTF-8"));

            final BlockingQueue<String> response = new ArrayBlockingQueue<String>(1);
        
            String result="";
            while (true) {
                QueueingConsumer.Delivery delivery = consumer.nextDelivery();
                if (delivery.getProperties().getCorrelationId().equals(corrId)) {
                    result = new String(delivery.getBody());
                    break;
                }   
            }
            System.out.println(result);
            return result;
        }catch(Exception e){
            e.printStackTrace();
            System.out.println(e.toString()+"-");
        }
        return "";
    }
    
    public void close(){
        try{
                channel.close();
                connection.close();
            }catch(Exception e1){
                System.out.println(e1.toString()+"-");
            }
    }
}
