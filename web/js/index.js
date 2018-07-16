
  select = function(s) {
    return document.querySelector(s);
  },
  selectAll = function(s) {
    return document.querySelectorAll(s);
  },
    mainSVG = select('.mainSVG'),
    orbit = select('#orbit'),
    dot = select('#dot'),
    startShape = select('#startShape'),
    endShape = select('#endShape'),
    shapeGroup = select('#shapeGroup'),
    pContainer = select('#pContainer'),
    particlePool = [],
    numParticles = 400,
    particleCount = 0


TweenMax.set('svg', {
  visibility: 'visible'
})
TweenMax.set(['#startShape','#endShape'], {
  transformOrigin:'50% 50%'
})

var orbitPath = MorphSVGPlugin.pathDataToBezier(orbit.getAttribute('d'), {
    offsetX: 0,
    offsetY: 0
  })

var mainTl = new TimelineMax();
var tl = new TimelineMax({ repeat:-1, yoyo:false});
var tl2 = new TimelineMax({ repeat:-1, yoyo:false, onUpdate:playParticle});
tl2.to(dot, 6, {
    bezier: {
      type: "cubic",
      values: orbitPath,
      autoRotate: false
    },
  ease:Linear.easeNone
})

//shapes
tl.to('#startShape', 20, {
  rotation:360,
  ease:Linear.easeNone
})
.to('#endShape', 20, {
  rotation:-360,
  ease:Linear.easeNone
},'-=20')

function createParticles() {
  
  var i = numParticles, p;
  while (--i > -1) {
    
    p = document.createElementNS(xmlns, 'use');
    p.setAttributeNS(xlinkns, "xlink:href", '#particle');
    pContainer.appendChild(p);

    //p.setAttributeNS(null, 'fill', particleColorArray[i % particleColorArray.length]);
    p.setAttributeNS(null, 'opacity', 0);
    p.setAttribute('class', "particle");
    particlePool.push(p);

  }

}

function playParticle(){
  var p = particlePool[particleCount];
  var curr = {x:dot._gsTransform.x, y:dot._gsTransform.y};
  var rad = Math.atan2(curr.y - 300, curr.x - 400);
  var deg = Math.round(rad * (180/Math.PI));
  //console.log(deg)
  //console.log(dot._gsTransform.x)
 TweenMax.set(p, {
     x:randomBetween(curr.x, curr.x - 5),
     y: randomBetween(curr.y, curr.y+5),
     alpha:1,
     transformOrigin:'50% 50%'
    });  
var tl = new TimelineMax();
  tl.to(p, randomBetween(3, 6), {
      //paused:true,
      physics2D: {
        velocity: randomBetween(5, 10),
        angle:(deg % 2) ? deg : deg - 180,//randomBetween(-95, -85),
        gravity:randomBetween(-1, 1)
      },

      scale:randomBetween(0, 3.3),
      //rotation:randomBetween(180, 780),
    onComplete:completeParticle,
    onCompleteParams:[p],
    alpha:0
      //skewY:(Math.random() * 180),
      //ease: Power4.easeIn,
     //onStart:flicker,
      //onStartParams:[p]

    });  
  
particleCount++;
  
  particleCount = (particleCount >=numParticles) ? 0 : particleCount  
}

function flicker(p){
  
  //console.log("flivker")
  TweenMax.killTweensOf(p, {alpha:true});
  TweenMax.fromTo(p, 0.4,{
    alpha:1
  }, {
    alpha:Math.random(),
    ease: RoughEase.ease.config({ template: Power0.easeNone, strength: 3, points: 6, taper: "both", randomize: true, clamp: false}),
    repeat:-1
  })
}

function completeParticle(p){
  TweenMax.set(p, {
    x:-10,
    y:-10,
    alpha:1,
    scale:1
  })
}

function randomBetween(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

createParticles();
mainTl.add(tl,0);
mainTl.add(tl2,0);

//ScrubGSAPTimeline(mainTl)
mainTl.timeScale(1)

TweenMax.globalTimeScale(1)