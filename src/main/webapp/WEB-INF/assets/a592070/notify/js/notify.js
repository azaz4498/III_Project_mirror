import store from './notifyStore.js';

Vue.use(httpVueLoader);
Vue.use(ELEMENT);
const notify = new Vue({
    el: '#notify',
    components: {
        "index": httpVueLoader(context+'/assets/a592070/notify/components/main.vue'),
    },
    // data() {
    //     return {
    //         stomp: undefined
    //     }
    // },
    // mounted: function(){
    //     this.connect();
    // },
    // methods: {
    //     notify(frame) {
    //         let data = JSON.parse(frame.body);
    //         console.log(data);
    //         if(data.status == 'success'){
    //             this.$notify({
    //                 title: data.title,
    //                 message: data.content,
    //                 type: 'success'
    //             });
    //         }else if(data.status == 'warning'){
    //             this.$notify({
    //                 title: data.title,
    //                 message: data.content,
    //                 type: 'warning'
    //             });
    //         }else if(data.status == 'error'){
    //             this.$notify.error({
    //                 title: data.title,
    //                 message: data.content,
    //                 duration: 0
    //             });
    //         }else{
    //             this.$notify.info({
    //                 title: data.title,
    //                 message: data.content,
    //             });
    //         }
    //
    //     },
    //     connect() {
    //         var socket = new SockJS('/ws');
    //         this.stomp = new Stomp.over(socket);
    //         // this.stomp = new Stomp.client('ws://localhost/ws');
    //         console.log(this.stomp);
    //
    //         this.stomp.connect("guest", "guest", this.connectCallback, this.errorCallback);
    //     },
    //     connectCallback(){
    //         this.stomp.subscribe('/topic/notify', this.notify);
    //     },
    //     errorCallback(error){
    //         alert(error.headers.message);
    //     }
    // },
    store
})
export default notify;